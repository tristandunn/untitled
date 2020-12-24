# frozen_string_literal: true

ruby   "2.7.2"
source "https://rubygems.org"

gem "bcrypt",          "3.1.16"
gem "bootsnap",        "1.5.1", require: false
gem "hiredis",         "0.6.3"
gem "i18n-js",         "3.8.0"
gem "jbuilder",        "2.10.1"
gem "oj",              "3.10.17"
gem "pg",              "1.2.3"
gem "puma",            "5.1.1"
gem "rack-timeout",    "0.6.0"
gem "rails",           "6.1.0"
gem "redis",           "4.2.5", require: %w(redis redis/connection/hiredis)
gem "sassc-rails",     "2.1.2"
gem "webpacker",       "5.2.1"

group :development, :test do
  gem "cacheflow",    "0.1.1"
  gem "dotenv-rails", "2.7.6"
  gem "rspec-rails",  "4.0.1"
end

group :development do
  gem "brakeman",                "4.10.0",  require: false
  gem "bundler-audit",           "0.7.0.1", require: false
  gem "listen",                  "3.3.3"
  gem "rubocop",                 "1.6.1", require: false
  gem "rubocop-performance",     "1.9.1", require: false
  gem "rubocop-rails",           "2.9.1", require: false
  gem "rubocop-rspec",           "2.1.0", require: false
  gem "spring",                  "2.1.1"
  gem "spring-commands-rspec",   "1.0.4"
  gem "spring-commands-rubocop", "0.2.0"
  gem "web-console",             "4.1.0"
end

group :test do
  gem "capybara",                 "3.34.0"
  gem "database_cleaner",         "1.8.5"
  gem "factory_bot_rails",        "6.1.0"
  gem "faker",                    "2.15.1"
  gem "rails-controller-testing", "1.0.5"
  gem "selenium-webdriver",       "3.142.7"
  gem "shoulda-matchers",         "4.4.1"
  gem "simplecov-console",        "0.8.0", require: false
  gem "timecop",                  "0.9.2"
end
