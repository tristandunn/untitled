# frozen_string_literal: true

ruby   "3.1.2"
source "https://rubygems.org"

gem "bcrypt",            "3.1.18"
gem "bootsnap",          "1.12.0", require: false
gem "hiredis",           "0.6.3"
gem "hotwire-rails",     "0.1.3"
gem "jbuilder",          "2.11.5"
gem "jsbundling-rails",  "1.0.3"
gem "oj",                "3.13.14"
gem "pg",                "1.4.1"
gem "puma",              "5.6.4"
gem "rack-timeout",      "0.6.3"
gem "rails",             "7.0.3"
gem "redis",             "4.7.0", require: %w(redis redis/connection/hiredis)
gem "sprockets-rails",   "3.4.2"
gem "strong_migrations", "1.2.0"
gem "tailwindcss-rails", "2.0.10"
gem "turbo-rails",       "1.1.1"

group :development, :test do
  gem "cacheflow",    "0.2.1"
  gem "dotenv-rails", "2.7.6"
  gem "rspec-rails",  "5.1.2"
end

group :development do
  gem "brakeman",            "5.2.3", require: false
  gem "listen",              "3.7.1"
  gem "rubocop",             "1.31.1", require: false
  gem "rubocop-performance", "1.14.2", require: false
  gem "rubocop-rails",       "2.15.1", require: false
  gem "rubocop-rspec",       "2.11.1", require: false
  gem "web-console",         "4.2.0"
end

group :test do
  gem "capybara",                 "3.37.1"
  gem "database_cleaner",         "2.0.1"
  gem "factory_bot_rails",        "6.2.0"
  gem "faker",                    "2.21.0"
  gem "rails-controller-testing", "1.0.5"
  gem "selenium-webdriver",       "4.3.0"
  gem "shoulda-matchers",         "5.1.0"
  gem "simplecov-console",        "0.9.1", require: false
  gem "timecop",                  "0.9.5"
end
