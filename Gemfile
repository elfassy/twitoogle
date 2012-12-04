source 'https://rubygems.org'
gem 'thin'
gem 'rails', '3.2.9'
gem 'foreman'
# Twitter API
gem 'twitter'

group :production do
  gem 'pg'
end

group :development do
  gem "haml-rails", ">= 0.3.4"
  gem "pry" 
  gem 'heroku'
  gem 'sqlite3'
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

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'compass-rails'
  gem "zurb-foundation", "~> 3.0"
end
gem 'jquery-rails'
gem "haml", ">= 3.1.6"