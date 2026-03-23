require "anthropic"

ANTHROPIC_CLIENT = Anthropic::Client.new(api_key: ENV['ANTHROPIC_API_KEY'])