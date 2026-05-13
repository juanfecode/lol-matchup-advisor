require "yaml"
require "digest"

class ChampionSearchService
  PROFILES = YAML.load_file(Rails.root.join("db/champion_profiles.yml")).freeze

  def self.search(query, limit: 5)
    # 1. RETRIEVE
    #    - generar embedding del query (EmbeddingService.generate)
    #    - usar Champion.nearest_neighbors(...).first(limit)
    vector = EmbeddingService.generate(query)
    champions = Champion.nearest_neighbors(:embedding, vector, distance: :cosine).first(limit)
    prompt = build_prompt(query, champions)

    explanation = generate_explanation(prompt)

    { champions: champions, explanation: explanation }
  end

  def self.build_prompt(query, champions)
    champions_block = champions.map.with_index(1) do |champion, idx|
      "#{idx}. #{champion.name}\n#{PROFILES[champion.name]['profile']}"
    end.join("\n\n")

    <<~PROMPT
      You are an expert League of Legends coach.

      A player is looking for a champion that matches this description:
      "#{query}"

      Based on a vector similarity search of champion profiles, here are the top #{champions.size} candidates:

      #{champions_block}

      For each champion, write 1-2 sentences explaining WHY they match the player's description.
      Be specific — reference their kit, strengths, or playstyle. Don't just repeat the profile verbatim.
      Format: numbered list, same order as above. Tone: friendly, like advising a friend.
    PROMPT
  end

  def self.generate_explanation(prompt)
    cache_key = "champion_search_explanation:#{Digest::SHA1.hexdigest(prompt)}"
    Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      Rails.logger.info "🔴 Cache MISS — Claude explanation (#{prompt.size} chars)"
      response = ANTHROPIC_CLIENT.messages.create(
        model: "claude-sonnet-4-20250514",
        max_tokens: 1024,
        messages: [
          { role: "user", content: prompt }
        ]
      )
      response.content[0].text
    end
  end
end
