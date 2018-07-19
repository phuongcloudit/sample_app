# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.5.1"

gem "bcrypt"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap-sass"
gem "bootstrap-will_paginate"
gem "carrierwave"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "faker"
gem "figaro"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "mini_magick"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.0"
gem "rubocop", "~> 0.53.0"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "will_paginate"

group :development, :test do
  gem "byebug", platforms: %i(mri mingw x64_mingw)
  gem "sqlite3"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15", "< 4.0"
  gem "chromedriver-helper"
  gem "rails-controller-testing"
  gem "selenium-webdriver"
end

gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)

group :production do
  gem "fog"
  gem "pg"
end
