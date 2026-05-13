require "net/http"
require "digest"

class EmbeddingService
  API_URL = "https://api.voyageai.com/v1/embeddings"
  MODEL = "voyage-3".freeze

  def self.generate(text)
    cache_key = "embedding:#{MODEL}:#{Digest::SHA1.hexdigest(text)}"
    Rails.cache.fetch(cache_key, expires_in: 30.days) do
      Rails.logger.info "🔴 Cache MISS — embedding via Voyage (#{text.size} chars)"
      fetch_from_voyage(text)
    end
  end

  def self.fetch_from_voyage(text)
    uri = URI(API_URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.path, {
                                    "Authorization" => "Bearer #{ENV.fetch('VOYAGE_API_KEY')}",
                                    "Content-Type" => "application/json"
                                  })
    request.body = { input: [text], model: MODEL }.to_json
    response = http.request(request)

    unless response.is_a?(Net::HTTPSuccess)
      raise "Voyage API error #{response.code}: #{response.body[0..200]}"
    end

    embedding = JSON.parse(response.body).dig("data", 0, "embedding")
    raise "Voyage returned no embedding in response" if embedding.nil?

    embedding
  rescue StandardError => e
    Rails.logger.error "⚠️ Failed to fetch embedding (#{e.class}: #{e.message})"
    raise
  end
end
