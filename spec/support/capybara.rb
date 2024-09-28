# frozen_string_literal: true

require 'capybara/rails'
require 'capybara/rspec'
require 'selenium-webdriver'

Capybara.register_driver(:chrome) do |app|
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.open_timeout = 120
  client.read_timeout = 120

  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('window-size=1920,1080')

  options.add_argument('headless') unless /^(false|no|0)$/.match?(ENV['CHROME_HEADLESS'])

  options.add_argument('disable-dev-shm-usage')

  options.add_argument('enable-features=NetworkService,NetworkServiceInProcess')

  options.add_argument('disable-gpu')

  options.add_argument('disable-features=VizDisplayCompositor')

  options.add_preference(:download, default_directory: Helpers::Download::DOWNLOAD_PATH.to_s)

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options,
    http_client: client
  )
end

Capybara.configure do |config|
  config.asset_host = 'http://localhost:3000'
  config.always_include_port = true
  config.default_driver = :chrome
  config.default_max_wait_time = 10
  config.enable_aria_label = true
  config.ignore_hidden_elements = true
  config.javascript_driver = :chrome
  config.server = :puma, { Silent: true }
  config.server_port = 54_321
end
