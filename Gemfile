# frozen_string_literal: true

ruby   "3.0.3"
source "https://rubygems.org"

gem "bcrypt",       "3.1.16"
gem "bootsnap",     "1.9.3", require: false
gem "hiredis",      "0.6.3"
gem "jbuilder",     "2.11.3"
gem "oj",           "3.13.9"
gem "pg",           "1.2.3"
gem "puma",         "5.5.2"
gem "rack-timeout", "0.6.0"
gem "rails",        "6.1.4.1"
gem "redis",        "4.5.1", require: %w(redis redis/connection/hiredis)
gem "sassc-rails",  "2.1.2"
gem "turbo-rails",  "0.9.0"
gem "webpacker",    "5.4.3"

group :development, :test do
  gem "cacheflow",    "0.1.1"
  gem "dotenv-rails", "2.7.6"
  gem "rspec-rails",  "5.0.2"
end

group :development do
  gem "brakeman",            "5.1.2", require: false
  gem "listen",              "3.7.0"
  gem "rubocop",             "1.23.0", require: false
  gem "rubocop-performance", "1.12.0", require: false
  gem "rubocop-rails",       "2.12.4", require: false
  gem "rubocop-rspec",       "2.6.0",  require: false
  gem "web-console",         "4.2.0"
end

group :test do
  gem "capybara",                 "3.36.0"
  gem "database_cleaner",         "2.0.1"
  gem "factory_bot_rails",        "6.2.0"
  gem "faker",                    "2.19.0"
  gem "rails-controller-testing", "1.0.5"
  gem "selenium-webdriver",       "4.0.3"
  gem "shoulda-matchers",         "5.0.0"
  gem "simplecov-console",        "0.9.1", require: false
  gem "timecop",                  "0.9.4"
end
