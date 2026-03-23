class RecommendationsController < ApplicationController
  def create
    @role = params[:your_role]
    raise @role
  end
end
