# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.1.3'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'phonelib'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.1'
gem 'redis', '>= 4.0.1'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'tailwindcss-rails'
gem 'turbo-rails'

gem 'cancancan', '~> 3.5'
gem 'devise', '~> 4.9', '>= 4.9.3'
gem 'haml-rails', '~> 2.1'

gem 'bootsnap', require: false
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'rspec-rails', '~> 6.0.0'
  gem 'rubocop', require: false
end

group :development do
  gem 'error_highlight', '>= 0.4.0', platforms: [:ruby]
  gem 'pry'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 5.0'
end
