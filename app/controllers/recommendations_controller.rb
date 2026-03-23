class RecommendationsController < ApplicationController
  def create
    @role = params[:your_role]
    @enemies = params[:enemies]
    @allies = params[:allies]
    @pool = params[:pool]
    @recommendation = ANTHROPIC_CLIENT.messages.create(
      model: "claude-sonnet-4-20250514",
      max_tokens: 1024,
      messages: [
        { role: "user",
          content: "you are an expert coach on League of Legends.
                You are given the following information about a game: your role is #{@role},
                your enemies are #{@enemies.join(', ')}, your allies are #{@allies.join(', ')},
                and the pool of champions you know how to use are #{@pool.join(', ')}.
                Based on this information, recommend the best champion for me to play in this game
                and explain why you think that champion is the best choice." }
      ]
    )

    respond_to do |format|
      format.turbo_stream
    end
  end
end
