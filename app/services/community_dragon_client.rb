class CommunityDragonClient
  BASE_URL = "https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1"

  def self.rune_image_url(perk_path)
    return nil if perk_path.blank?
    "#{BASE_URL}/perk-images/styles/#{perk_path}.png"
  end
end
