# frozen_string_literal: true

require 'selenium-webdriver'

Capybara.register_driver :chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--window-size=1400,1400')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--disable-gpu')

  Capybara::Selenium::Driver.new(
    app,
    url: "http://#{ENV.fetch('SELENIUM_HOST')}:4444/wd/hub",
    browser: :remote,
    options:
  )
end

RSpec.configure do |config|
  ip_host = IPSocket.getaddress(Socket.gethostname)

  config.before(:each, type: :system) do
    Capybara.app_host = "http://#{ip_host}"
    Capybara.server_host = ip_host

    driven_by :chrome_headless
  end
end
