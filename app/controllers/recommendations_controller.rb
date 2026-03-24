class RecommendationsController < ApplicationController
  def create
    @role = params[:your_role]
    @enemies = params[:enemies].compact.reject(&:empty?)
    @allies = params[:allies].compact.reject(&:empty?)
    @pool = params[:pool].compact.reject(&:empty?)

    prompt = <<~PROMPT
      You are an expert League of Legends coach.

      A player needs help choosing a champion for their game.

      THEIR ROLE: #{@role}
      THEIR CHAMPION POOL: #{@pool.join(', ')}
      ENEMY TEAM: #{@enemies.join(', ')}
      ALLY TEAM: #{@allies.join(', ')}

      Analyze the full team composition and recommend the best champion from their pool.
      Consider synergies with allies, threats from enemies, and lane matchups.

      RESPOND ONLY WITH VALID JSON. No markdown, no extra text. Use this exact structure:
      {
        "best_pick": {
          "champion": "ExactChampionName",
          "why": "2-3 sentence explanation of why this champion is best for this matchup",
          "runes": {
            "keystone": "Conqueror",
            "primary_tree": "Precision",
            "primary": ["Triumph", "Legend: Alacrity", "Last Stand"] for example,
            "secondary_tree": "Resolve",
            "secondary": ["Bone Plating", "Unflinching"]
          },
          "build": {
            "core": ["Item1", "Item2", "Item3"],
            "situational": ["Item4", "Item5"]
          },
          "threats": "Which enemies to watch out for and why",
          "win_condition": "How to win this game with this pick"
        },
        "second_pick": {
          "champion": "ExactChampionName",
          "why": "Brief explanation"
        },
        "third_pick": {
          "champion": "ExactChampionName",
          "why": "Brief explanation"
        }
      }

      IMPORTANT: The champion names must match exactly: #{@pool.join(', ')}
    PROMPT

    response = ANTHROPIC_CLIENT.messages.create(
      model: "claude-sonnet-4-20250514",
      max_tokens: 1024,
      messages: [
        { role: "user", content: prompt }
      ]
    )

    raw_text = response.content[0].text.gsub(/```json\n?/, "").gsub(/```\n?/, "").strip
    @data = JSON.parse(raw_text)
    @champion_images = Champion.pluck(:name, :image_url).to_h

    respond_to do |format|
      format.turbo_stream
    end
  end
end
