require "net/http"

class DataDragonClient
  VERSIONS_URL = "https://ddragon.leagueoflegends.com/api/versions.json"
  CDN_BASE = "https://ddragon.leagueoflegends.com/cdn"
  FALLBACK_VERSION = "16.9.1".freeze

  def self.latest_version
    Rails.cache.fetch("ddragon:latest_version", expires_in: 24.hours) do
      Rails.logger.info "🔴 Cache MISS — fetching Data Dragon versions"
      response = Net::HTTP.get(URI(VERSIONS_URL))
      JSON.parse(response).first
    end
  rescue StandardError => e
    Rails.logger.error "⚠️ Data Dragon unreachable (#{e.class}: #{e.message}) — using fallback #{FALLBACK_VERSION}"
    FALLBACK_VERSION
  end

  def self.champion_image_url(filename)
    "#{CDN_BASE}/#{latest_version}/img/champion/#{filename}"
  end

  def self.item_image_url(item_id)
    "#{CDN_BASE}/#{latest_version}/img/item/#{item_id}.png"
  end

  def self.item_image_url_by_name(name)
    id = items_lookup[name]
    return nil unless id
    item_image_url(id)
  end

  def self.champions_data_url
    "#{CDN_BASE}/#{latest_version}/data/en_US/champion.json"
  end

  # ─── Runas ───────────────────────────────────────────

  def self.rune_icon_path(rune_name)
    runes_lookup[rune_name]
  end

  def self.runes_lookup
    Rails.cache.fetch("ddragon:runes_lookup:#{latest_version}", expires_in: 24.hours) do
      Rails.logger.info "🔴 Cache MISS — fetching and indexing runes"
      response = Net::HTTP.get(URI("#{CDN_BASE}/#{latest_version}/data/en_US/runesReforged.json"))
      build_runes_lookup(JSON.parse(response))
    end
  rescue StandardError => e
    Rails.logger.error "⚠️ Failed to fetch runes (#{e.class}: #{e.message})"
    {}
  end

  def self.build_runes_lookup(trees)
    lookup = {}
    trees.each do |tree|
      tree["slots"].each do |slot|
        slot["runes"].each do |rune|
          lookup[rune["name"]] = icon_to_cdragon_path(rune["icon"])
        end
      end
    end
    lookup
  end

  def self.icon_to_cdragon_path(icon)
    icon
      .sub(%r{^perk-images/Styles/}i, "")
      .sub(/\.png$/i, "")
      .downcase
  end

  # ─── Items ───────────────────────────────────────────

  def self.items_lookup
    Rails.cache.fetch("ddragon:items_lookup:#{latest_version}", expires_in: 24.hours) do
      Rails.logger.info "🔴 Cache MISS — fetching and indexing items"
      response = Net::HTTP.get(URI("#{CDN_BASE}/#{latest_version}/data/en_US/item.json"))
      build_items_lookup(JSON.parse(response)["data"])
    end
  rescue StandardError => e
    Rails.logger.error "⚠️ Failed to fetch items (#{e.class}: #{e.message})"
    {}
  end

  def self.build_items_lookup(items_data)
    lookup = {}
    items_data.each do |id, item|
      next if id.to_i >= 100_000
      lookup[item["name"]] ||= id.to_i
    end
    lookup
  end
end
