require 'rspec'
require 'selenium-webdriver'
require 'json'

describe 'Tes' do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @vars = {}
    @driver.manage.window.resize_to(1552, 880)  # Ubah ukuran jendela browser
  end

  after(:each) do
    @driver.quit
  end

  it 'tes' do
    # Test name: tes
    # Step # | name | target | value
    # 1 | open | /login | 
    @driver.get('https://app.jubelio.com/login')
    # 3 | type | name=email | qa.rakamin.jubelio@gmail.com
    @driver.find_element(:name, 'email').send_keys('qa.rakamin.jubelio@gmail.com')
    # 4 | click | name=password | 
    @driver.find_element(:name, 'password').click
    # 5 | type | name=password | Jubelio123!
    @driver.find_element(:name, 'password').send_keys('Jubelio123!')
    # 6 | click | css=.ladda-button | 
    @driver.find_element(:css, '.ladda-button').click
    # Tambahkan penundaan agar halaman memiliki waktu untuk memuat
    sleep 9
    # 7 | close |  | 
  end
end
