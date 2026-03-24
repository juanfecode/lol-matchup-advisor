class MatchupsController < ApplicationController
  def index
    @champions = Champion.all.order(:name)
    @champion_images = @champions.each_with_object({}) { |c, h| h[c.name] = c.image_url }
  end
end
