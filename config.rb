gem "json", "< 3" # json 3.0.2 breaks Faraday's JSON response parsing
require "dotenv/load"
require "ruby_llm"

RubyLLM.configure do |config|
  config.openai_api_key = ENV["OPENAI_API_KEY"]
end
