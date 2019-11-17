# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'bootsnap'
gem 'dry-validation', '0.11.1'
gem 'octokit'
gem 'pg'
gem 'puma'
gem 'rails', '~> 6.0.1'
gem 'sass-rails'
gem 'sidekiq'
gem 'sidekiq-scheduler'
gem 'slack-notifier'
gem 'trailblazer'
gem 'turbolinks'
gem 'webpacker'

group :development do
  gem 'listen'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development, :test do
  gem 'brakeman'
  gem 'bullet'
  gem 'bundle-audit'
  gem 'bundler-leak'
  gem 'database_consistency'
  gem 'fasterer'
  gem 'lefthook'
  gem 'mock_redis'
  gem 'rails_best_practices'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :test do
  gem 'dox', require: false
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'fuubar'
  gem 'json-schema'
  gem 'json_matchers'
  gem 'rspec-sidekiq'
  gem 'rspec_junit_formatter'
  gem 'shoulda-matchers'
  gem 'simplecov'
end
