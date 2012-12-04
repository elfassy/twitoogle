
Twitter.configure do |config|
  config.consumer_key =  ENV_CONFIG["twitter"]["consumer_key"]
  config.consumer_secret = ENV_CONFIG["twitter"]["consumer_secret"]
  config.oauth_token = ENV_CONFIG["twitter"]["oauth_token"]
  config.oauth_token_secret = ENV_CONFIG["twitter"]["oauth_token_secret"]
end