# frozen_string_literal: true

ruby   "3.0.2"
source "https://rubygems.org"

gem "bcrypt",       "3.1.16"
gem "bootsnap",     "1.8.1", require: false
gem "hiredis",      "0.6.3"
gem "jbuilder",     "2.11.2"
gem "oj",           "3.13.6"
gem "pg",           "1.2.3"
gem "puma",         "5.4.0"
gem "rack-timeout", "0.6.0"
gem "rails",        "6.1.4.1"
gem "redis",        "4.4.0", require: %w(redis redis/connection/hiredis)
gem "sassc-rails",  "2.1.2"
gem "turbo-rails",  "0.7.11"
gem "webpacker",    "5.4.3"

group :development, :test do
  gem "cacheflow",    "0.1.1"
  gem "dotenv-rails", "2.7.6"
  gem "rspec-rails",  "5.0.2"
end

group :development do
  gem "brakeman",                "5.1.1",   require: false
  gem "bundler-audit",           "0.9.0.1", require: false
  gem "listen",                  "3.7.0"
  gem "rubocop",                 "1.21.0", require: false
  gem "rubocop-performance",     "1.11.5", require: false
  gem "rubocop-rails",           "2.12.2", require: false
  gem "rubocop-rspec",           "2.4.0",  require: false
  gem "spring",                  "3.0.0"
  gem "spring-commands-rspec",   "1.0.4"
  gem "web-console",             "4.1.0"
end

group :test do
  gem "capybara",                 "3.35.3"
  gem "database_cleaner",         "2.0.1"
  gem "factory_bot_rails",        "6.2.0"
  gem "faker",                    "2.19.0"
  gem "rails-controller-testing", "1.0.5"
  gem "selenium-webdriver",       "3.142.7"
  gem "shoulda-matchers",         "5.0.0"
  gem "simplecov-console",        "0.9.1", require: false
  gem "timecop",                  "0.9.4"
end
