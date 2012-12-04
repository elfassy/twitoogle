# Load the rails application
require File.expand_path('../application', __FILE__)

# Load global configurations
ENV_CONFIG = YAML.load_file(Rails.root.join("config", "env_config.yml"))

# Initialize the rails application
Twitoogle::Application.initialize!
