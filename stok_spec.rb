require 'selenium-webdriver'
require 'rspec'

describe 'Stok' do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @wait = Selenium::WebDriver::Wait.new(timeout: 10)
  end

  after(:each) do
    @driver.quit
  end

  def retry_action(retries = 3)
    attempts = 0
    begin
      yield
    rescue Selenium::WebDriver::Error::StaleElementReferenceError
      attempts += 1
      retry if attempts < retries
      raise
    end
  end

  it 'stok' do
    @driver.get('https://app.jubelio.com/login')
    @driver.manage.window.resize_to(1552, 880)

    @driver.find_element(:name, 'email').click
    @driver.find_element(:name, 'email').send_keys('qa.rakamin.jubelio@gmail.com')

    @driver.find_element(:name, 'password').click
    @driver.find_element(:name, 'password').send_keys('Jubelio123!')

    @driver.find_element(:css, '.ladda-button').click

    @wait.until { @driver.find_element(:link_text, 'Barang') }.click

    @wait.until { @driver.find_element(:css, '.visible > .metismenu-item:nth-child(2) span') }.click

    @wait.until { @driver.find_element(:css, 'div:nth-child(1) > .react-grid-Row .react-grid-checkbox-label') }.click

    element = @wait.until { @driver.find_element(:css, '.ladda-button:nth-child(3)') }
    @driver.action.move_to(element).perform

    element = @wait.until { @driver.find_element(:css, 'body') }
    @driver.action.move_to(element, 0, 0).perform

    @driver.find_element(:css, '.btn-primary > .ladda-label').click

    # Find and interact with elements using the retry mechanism
    retry_action do
      element = @wait.until { @driver.find_element(:css, '.form-group:nth-child(2) .form-control') }
      element.send_keys('21 Agt 2023')
    end

    @wait.until { @driver.find_element(:css, 'span .react-grid-checkbox-label') }.click

    @driver.find_element(:css, '.row-selected:nth-child(2) > .react-grid-Cell__value').click
    @driver.find_element(:css, '.row-selected:nth-child(2) > .react-grid-Cell__value').click
    @driver.find_element(:css, '.row-selected:nth-child(2) > .react-grid-Cell__value').click

    element = @wait.until { @driver.find_element(:css, '.row-selected:nth-child(2) > .react-grid-Cell__value') }
    @driver.action.double_click(element).perform

    @driver.find_element(:css, '.editor-main').send_keys('120')

    element = @wait.until { @driver.find_element(:name, 'note') }
    element.click
    element.click

    element = @wait.until { @driver.find_element(:css, '.pull-right > .ladda-button') }
    @driver.action.move_to(element).perform

    element = @wait.until { @driver.find_element(:css, 'body') }
    @driver.action.move_to(element, 0, 0).perform

    element = @wait.until { @driver.find_element(:name, 'note') }
    element.send_keys('tes')
    login_button.click()
    
    sleep 10
  end
end
