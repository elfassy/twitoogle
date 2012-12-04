source 'https://rubygems.org'
gem 'thin'
gem 'rails', '3.2.9'
gem 'sqlite3'
gem 'foreman'
# Twitter API
gem 'twitter'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'compass-rails'
  gem "zurb-foundation", "~> 3.0"
end
gem 'jquery-rails'
gem "haml", ">= 3.1.6"

group :development do
  gem "haml-rails", ">= 0.3.4"
  gem "pry" 
  gem 'heroku'
end

gem "rspec-rails", group: [:test, :development]
group :test do
  gem "capybara"
  gem "guard-rspec"
  gem 'rb-inotify'
  gem 'vcr', git: "git://github.com/vcr/vcr.git"
  gem 'webmock'
  gem 'capybara-webkit', git: "git://github.com/thoughtbot/capybara-webkit.git"
end