class RecommendationsController < ApplicationController
  def create
    @role = params[:your_role]
    @enemies = params[:enemies]
    @allies = params[:allies]
    @pool = params[:pool]

    prompt = <<~PROMPT
      You are an expert League of Legends coach.

      A player needs help choosing a champion for their game.

      THEIR ROLE: #{@role}
      THEIR CHAMPION POOL: #{@pool.join(', ')}

      ENEMY TEAM: #{@enemies.compact.reject(&:empty?).join(', ')}

      ALLY TEAM: #{@allies.compact.reject(&:empty?).join(', ')}

      Analyze the full team composition to recommend the optimal keystone.
      Consider the synergies between the player's champion pool and their allies, 
      as well as the threats posed by the enemy champions.
      Consider factors like: does the enemy have tanks to shred? 
      Is there a poke comp that needs sustain?

      Based on this matchup, recommend which champion from their pool they should play.
      Structure your response exactly like this:

      ## Best Pick: [champion name]
      ### Runes: [rune page name]
      ### Build: [first Core Build and then situational items]
      ### Why this champion wins this matchup: [explanation]
      ### Threats to watch out for: [specific enemies to respect]
      ### Win condition: [how to win the game with this pick]

      ## Second Option: [champion name]
      ### Why: [brief explanation]

      ## Third Option: [champion name]
      ### Why: [brief explanation]
    PROMPT

    @recommendation = ANTHROPIC_CLIENT.messages.create(
      model: "claude-sonnet-4-20250514",
      max_tokens: 1024,
      messages: [
        { role: "user", content: prompt }
      ]
    )

    respond_to do |format|
      format.turbo_stream
    end
  end
end
