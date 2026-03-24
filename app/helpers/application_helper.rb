module ApplicationHelper
  def markdown_to_html(text)
    renderer = Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(text).html_safe
  end

  RUNE_IDS = {
    # Precision - Keystones
    "Conqueror" => 8010, "Lethal Tempo" => 8008,
    "Fleet Footwork" => 8021, "Press the Attack" => 8005,
    # Precision - Minor
    "Triumph" => 9111, "Presence of Mind" => 8009, "Overheal" => 9101,
    "Legend: Alacrity" => 9104, "Legend: Tenacity" => 9105, "Legend: Bloodline" => 9103,
    "Coup de Grace" => 8014, "Cut Down" => 8017, "Last Stand" => 8299,
    # Domination - Keystones
    "Electrocute" => 8112, "Dark Harvest" => 8128,
    "Hail of Blades" => 9923, "Predator" => 8124,
    # Domination - Minor
    "Cheap Shot" => 8126, "Taste of Blood" => 8139, "Sudden Impact" => 8143,
    "Zombie Ward" => 8136, "Ghost Poro" => 8120, "Eyeball Collection" => 8138,
    "Treasure Hunter" => 8135, "Relentless Hunter" => 8105,
    "Ultimate Hunter" => 8106, "Ingenious Hunter" => 8134,
    # Sorcery - Keystones
    "Summon Aery" => 8214, "Arcane Comet" => 8229, "Phase Rush" => 8230,
    # Sorcery - Minor
    "Nullifying Orb" => 8224, "Manaflow Band" => 8226, "Nimbus Cloak" => 8275,
    "Transcendence" => 8210, "Celerity" => 8234, "Absolute Focus" => 8233,
    "Scorch" => 8237, "Waterwalking" => 8232, "Gathering Storm" => 8236,
    # Resolve - Keystones
    "Grasp of the Undying" => 8437, "Aftershock" => 8439, "Guardian" => 8465,
    # Resolve - Minor
    "Demolish" => 8446, "Font of Life" => 8463, "Shield Bash" => 8401,
    "Conditioning" => 8429, "Second Wind" => 8444, "Bone Plating" => 8473,
    "Overgrowth" => 8451, "Revitalize" => 8453, "Unflinching" => 8242,
    # Inspiration - Keystones
    "Glacial Augment" => 8351, "Unsealed Spellbook" => 8360, "First Strike" => 8369,
    # Inspiration - Minor
    "Hextech Flashtraption" => 8306, "Magical Footwear" => 8304, "Cash Back" => 8321,
    "Triple Tonic" => 8345, "Time Warp Tonic" => 8352, "Biscuit Delivery" => 8313,
    "Cosmic Insight" => 8347, "Approach Velocity" => 8410, "Jack of All Trades" => 8346
  }.freeze

  def rune_image_url(rune_name)
    id = RUNE_IDS[rune_name]
    return nil unless id
    "https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/perk-images/styles/#{perk_path(id)}.png"
  end

  private

  PERK_PATHS = {
    # Precision Keystones
    8010 => "precision/conqueror/conqueror",
    8008 => "precision/lethaltemporarytemp/lethaltemporarytemp",
    8021 => "precision/fleetfootwork/fleetfootwork",
    8005 => "precision/presstheattack/presstheattack",
    # Precision Minor
    9111 => "precision/triumph", 8009 => "precision/presenceofmind/presenceofmind",
    9101 => "precision/overheal", 9104 => "precision/legendalacrity/legendalacrity",
    9105 => "precision/legendtenacity/legendtenacity", 9103 => "precision/legendbloodline/legendbloodline",
    8014 => "precision/coupdegrace/coupdegrace", 8017 => "precision/cutdown/cutdown",
    8299 => "precision/laststand/laststand",
    # Domination Keystones
    8112 => "domination/electrocute/electrocute", 8128 => "domination/darkharvest/darkharvest",
    9923 => "domination/hailofblades/hailofblades", 8124 => "domination/predator/predator",
    # Domination Minor
    8126 => "domination/cheapshot/cheapshot", 8139 => "domination/tasteofblood/greenterror_tasteofblood",
    8143 => "domination/suddenimpact/suddenimpact", 8136 => "domination/zombieward/zombieward",
    8120 => "domination/ghostporo/ghostporo", 8138 => "domination/eyeballcollection/eyeballcollection",
    8135 => "domination/treasurehunter/treasurehunter", 8105 => "domination/relentlesshunter/relentlesshunter",
    8106 => "domination/ultimatehunter/ultimatehunter", 8134 => "domination/ingenioushunter/ingenioushunter",
    # Sorcery Keystones
    8214 => "sorcery/summonaery/summonaery", 8229 => "sorcery/arcanecomet/arcanecomet",
    8230 => "sorcery/phaserush/phaserush",
    # Sorcery Minor
    8224 => "sorcery/nullifyingorb/pokeshield", 8226 => "sorcery/manaflowband/manaflowband",
    8275 => "sorcery/nimbuscloak/6361", 8210 => "sorcery/transcendence/transcendence",
    8234 => "sorcery/celerity/celeritytemp", 8233 => "sorcery/absolutefocus/absolutefocus",
    8237 => "sorcery/scorch/scorch", 8232 => "sorcery/waterwalking/waterwalking",
    8236 => "sorcery/gatheringstorm/gatheringstorm",
    # Resolve Keystones
    8437 => "resolve/graspoftheundying/graspoftheundying",
    8439 => "resolve/veteranaftershock/veteranaftershock", 8465 => "resolve/guardian/guardian",
    # Resolve Minor
    8446 => "resolve/demolish/demolish", 8463 => "resolve/fontoflife/fontoflife",
    8401 => "resolve/mirrorshell/mirrorshell", 8429 => "resolve/conditioning/conditioning",
    8444 => "resolve/secondwind/secondwind", 8473 => "resolve/boneplating/boneplating",
    8451 => "resolve/overgrowth/overgrowth", 8453 => "resolve/revitalize/revitalize",
    8242 => "resolve/unflinching/unflinching",
    # Inspiration Keystones
    8351 => "inspiration/glacialaugment/glacialaugment",
    8360 => "inspiration/unsealedspellbook/unsealedspellbook", 8369 => "inspiration/firststrike/firststrike",
    # Inspiration Minor
    8306 => "inspiration/hextechflashtraption/hextechflashtraption",
    8304 => "inspiration/magicalfootwear/magicalfootwear", 8321 => "inspiration/cashback/cashback",
    8345 => "inspiration/tripletonic/tripletonic", 8352 => "inspiration/timewarptonic/timewarptonic",
    8313 => "inspiration/biscuitdelivery/biscuitdelivery", 8347 => "inspiration/cosmicinsight/cosmicinsight",
    8410 => "inspiration/approachvelocity/approachvelocity", 8346 => "inspiration/jackofalltrades/jackofalltrades"
  }.freeze

  def perk_path(id)
    PERK_PATHS[id]
  end

  ITEM_IDS = {
    # Boots
    "Berserker's Greaves" => 3006, "Boots of Swiftness" => 3009,
    "Ionian Boots of Lucidity" => 3158, "Mercury's Treads" => 3111,
    "Plated Steelcaps" => 3047, "Sorcerer's Shoes" => 3020,
    # Fighter / Bruiser
    "Trinity Force" => 3078, "Divine Sunderer" => 6632,
    "Black Cleaver" => 3071, "Sterak's Gage" => 3053,
    "Death's Dance" => 6333, "Maw of Malmortius" => 3156,
    "Blade of the Ruined King" => 3153, "Wit's End" => 3091,
    "Ravenous Hydra" => 3074, "Titanic Hydra" => 3748,
    "Stridebreaker" => 6631, "Goredrinker" => 6630,
    "Sundered Sky" => 6698, "Spear of Shojin" => 3161,
    "Hullbreaker" => 3181, "Experimental Hexplate" => 6697,
    # ADC / Marksman
    "Infinity Edge" => 3031, "Kraken Slayer" => 6672,
    "Phantom Dancer" => 3046, "Rapid Firecannon" => 3094,
    "Statikk Shiv" => 3087, "Lord Dominik's Regards" => 3036,
    "Mortal Reminder" => 3033, "Bloodthirster" => 3072,
    "Immortal Shieldbow" => 6673, "Navori Quickblades" => 6675,
    "Essence Reaver" => 3508, "Collector" => 6676,
    "Terminus" => 6696, "Yun Tal Wildarrows" => 6695,
    # AP / Mage
    "Rabadon's Deathcap" => 3089, "Void Staff" => 3135,
    "Zhonya's Hourglass" => 3157, "Banshee's Veil" => 3102,
    "Lich Bane" => 3100, "Nashor's Tooth" => 3115,
    "Morellonomicon" => 3165, "Shadowflame" => 4645,
    "Horizon Focus" => 4628, "Cosmic Drive" => 4629,
    "Luden's Companion" => 6655, "Liandry's Torment" => 6653,
    "Rod of Ages" => 3027, "Archangel's Staff" => 3003,
    "Seraph's Embrace" => 3040, "Malignance" => 6699,
    "Stormsurge" => 6694, "Cryptbloom" => 6693,
    # Tank
    "Sunfire Aegis" => 3068, "Hollow Radiance" => 6692,
    "Iceborn Gauntlet" => 6662, "Jak'Sho, The Protean" => 6665,
    "Randuin's Omen" => 3143, "Thornmail" => 3075,
    "Spirit Visage" => 3065, "Force of Nature" => 4401,
    "Warmog's Armor" => 3083, "Dead Man's Plate" => 3742,
    "Gargoyle Stoneplate" => 3193, "Kaenic Rookern" => 6691,
    "Unending Despair" => 6690,
    # Support
    "Redemption" => 3107, "Ardent Censer" => 3504,
    "Staff of Flowing Water" => 6616, "Mikael's Blessing" => 3222,
    "Knight's Vow" => 3109, "Locket of the Iron Solari" => 3190,
    "Zeke's Convergence" => 3050, "Shurelya's Battlesong" => 2065,
    "Echoes of Helia" => 6617,
    # Assassin
    "Youmuu's Ghostblade" => 3142, "Edge of Night" => 3814,
    "Serpent's Fang" => 6695, "Axiom Arc" => 6696,
    "Profane Hydra" => 6698, "Hubris" => 6697,
    "Opportunity" => 6701, "Voltaic Cyclosword" => 6700,
    # Jungle
    "Gustwalker Hatchling" => 3854, "Mosstomper Seedling" => 3855,
    "Scorchclaw Pup" => 3856
  }.freeze

  def item_image_url(item_name)
    id = ITEM_IDS[item_name]
    return nil unless id
    "https://ddragon.leagueoflegends.com/cdn/14.6.1/img/item/#{id}.png"
  end
end
