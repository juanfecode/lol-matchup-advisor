class MatchupsController < ApplicationController
  def index
    @champions = Champion.all.order(:name)
  end
end
