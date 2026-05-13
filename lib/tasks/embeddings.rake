namespace :embeddings do
  desc "generate embeddings for all champios from db/champion_profiles.yml"
  task seed: :environment do
    profiles = YAML.load_file(Rails.root.join("db/champion_profiles.yml"))
    Champion.find_each.with_index(1) do |champion, index|
      profile_data = profiles[champion.name]
      if profile_data.nil?
        puts "⚠️ #{champion.name}: no profile found, skipping"
        next
      end

      text = profile_data["profile"]

      begin
        embedding = EmbeddingService.generate(text)
        champion.update!(embedding: embedding)
        puts "✅ [#{index}/172] #{champion.name}"
      rescue StandardError => e
        puts "❌ [#{index}/172] #{champion.name} failed: #{e.message}"
        next
      end
    end
    total = Champion.count
    with_embedding = Champion.where.not(embedding: nil).count
    puts "\nDone. #{with_embedding}/#{total} champions have embeddings."
  end
end
