# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri'
require 'json'

url = "https://ddragon.leagueoflegends.com/cdn/14.6.1/data/en_US/champion.json"
data = JSON.parse(URI.open(url).read)

data["data"].each do |key, champion|
  Champion.find_or_create_by(champion_id: champion["id"]) do |c|
    c.name = champion ["name"]
    c.title = champion ["title"]
    c.image_url = "https://ddragon.leagueoflegends.com/cdn/14.6.1/img/champion/#{champion["image"]["full"]}"
  end
end

puts "Cargados #{Champion.count} campeones!"