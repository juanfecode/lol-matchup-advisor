require "json"
require "net/http"

champions_data = JSON.parse(Net::HTTP.get(URI(DataDragonClient.champions_data_url)))

champions_data["data"].each do |_key, champion|
  record = Champion.find_or_initialize_by(champion_id: champion["id"])
  record.name = champion["name"]
  record.title = champion["title"]
  record.image_url = DataDragonClient.champion_image_url(champion["image"]["full"])
  record.save!
end

puts "✅ #{Champion.count} campeones cargados (versión #{DataDragonClient.latest_version})"
