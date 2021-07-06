# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# The fastest JSON parser and object serializer.
gem 'oj', '~> 3.11', '>= 3.11.8'
# An experimental Object-base Parallel Evaluation Environment.
gem 'oj_mimic_json', '~> 1.0', '>= 1.0.1'

# Use to easily generate fake data
gem 'faker', '~> 2.18'

# Attach cloud and local files in Rails applications
gem 'activestorage', '~> 5.2', '>= 5.2.3'

# Sass-powered version of Bootstrap 3
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
# Integrate SassC-Ruby into Rails.
gem 'sassc-rails', '~> 2.1', '>= 2.1.2'
# Provides jQuery and the jQuery-ujs driver for your Rails 4+ application
gem 'jquery-rails', '~> 4.4'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Strategies for cleaning databases
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
  # Provides a framework and DSL for defining and using factories
  gem 'factory_bot', '~> 6.2'
  gem 'factory_bot_rails', '~> 6.2'
  # Pry is a runtime developer console
  gem 'pry', '~> 0.14.1'
  # Extracting `assigns` and `assert_template` from ActionDispatch.
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  # Provides a pure Ruby implementation of the GNU readline C library
  gem 'rb-readline', '~> 0.5.5'
  # Set of matchers and helpers for testing API
  gem 'rspec-json_expectations', '~> 2.2'
  # Testing framework
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Provides RSpec- and Minitest-compatible one-liners to test common Rails functionality
  gem 'shoulda-matchers', '~> 4.5', '>= 4.5.1'
  # Code style checking and code formatting tool
  gem 'rubocop', '~> 1.18', '>= 1.18.2', require: false
  # for launching cross-platform applications
  gem 'launchy', '~> 2.5'
  # RSpec matchers and Cucumber steps for testing JSON content
  gem 'json_spec', '~> 1.1', '>= 1.1.5'
  # RSpec matchers for database queries
  gem 'db-query-matchers', '~> 0.10.0'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
