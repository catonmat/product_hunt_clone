ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'capybara-screenshot/minitest'

class ActiveSupport::TestCase
  include Capybara::Screenshot::MiniTestPlugin
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  set_fixture_class 'product_fixtures' => Product

  # Devise test helpers
  include Warden::Test::Helpers
  Warden.test_mode!
end

class ActionDispatch::IntegrationTest
  include Capybara::Screenshot::MiniTestPlugin
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    'chromeOptions' => { args: %w(headless disable-gpu) + [ 'window-size=1280,800' ] })
  Capybara::Selenium::Driver.new app, browser: :chrome, desired_capabilities: capabilities
end
Capybara.save_path = Rails.root.join('tmp/capybara')
Capybara.javascript_driver = :headless_chrome
