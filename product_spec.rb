require 'selenium-webdriver'
require 'rspec'

describe 'Product' do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @wait = Selenium::WebDriver::Wait.new(timeout: 10)
  end

  after(:each) do
    @driver.quit
  end

  it 'product' do
    @driver.get('https://app.jubelio.com/login')
    @driver.manage.window.resize_to(1552, 880)

    @driver.find_element(:name, 'email').send_keys('qa.rakamin.jubelio@gmail.com')
    @driver.find_element(:name, 'password').send_keys('Jubelio123!')
    @driver.find_element(:css, '.ladda-button').click

    # Wait for the element to be clickable
    @wait.until { @driver.find_element(:css, '.metismenu-container:nth-child(1) > .metismenu-item:nth-child(2) > .metismenu-link .metismenu-state-icon') }
    
    @driver.find_element(:css, '.metismenu-container:nth-child(1) > .metismenu-item:nth-child(2) > .metismenu-link .metismenu-state-icon').click

    # Wait for the element to be clickable
    @wait.until { @driver.find_element(:css, '.visible > .metismenu-item:nth-child(2) span') }
    @driver.find_element(:css, '.visible > .metismenu-item:nth-child(2) span').click

    # Wait for the element to be clickable
    @wait.until { @driver.find_element(:css, 'div:nth-child(1) > .react-grid-Row .react-grid-checkbox-label') }
    @driver.find_element(:css, 'div:nth-child(1) > .react-grid-Row .react-grid-checkbox-label').click

    # Wait for the element to be clickable
    @wait.until { @driver.find_element(:id, 'list-children') }
    @driver.find_element(:id, 'list-children').click

    # Wait for the element to be clickable
    @wait.until { @driver.find_element(:link_text, 'SKU yang dipilih') }
    @driver.find_element(:link_text, 'SKU yang dipilih').click
  end
end
