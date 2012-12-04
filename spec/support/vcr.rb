VCR.configure do |c|
  c.cassette_library_dir = Rails.root.join("spec","vcr_cassettes")
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
  c.ignore_localhost = true

  c.filter_sensitive_data("<twitter_consumer_key>") {  ENV_CONFIG["twitter"]["consumer_key"] }
  c.filter_sensitive_data("<twitter_consumer_secret>") {  ENV_CONFIG["twitter"]["consumer_secret"]}
  c.filter_sensitive_data("<twitter_oauth_token>") {  ENV_CONFIG["twitter"]["oauth_token"]}
  c.filter_sensitive_data("<twitter_oauth_token_secret>") {  ENV_CONFIG["twitter"]["oauth_token_secret"]}
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.around(:each, :vcr) do |example|
    name = example.metadata[:full_description].split(/\s+/, 2).join("/").underscore.gsub(/[^\w\/]+/, "_")
    options = example.metadata.slice(:record, :match_requests_on).except(:example_group)
    VCR.use_cassette(name, options) { example.call }
  end
end