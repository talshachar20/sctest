require 'selenium-webdriver'
require 'pry'

class BasePage

  def initialize(driver)
    @driver = driver
    @driver.manage.timeouts.implicit_wait = 5
    @driver.manage.window.maximize #chrome issue on mac with maximize
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def find(locator)
    @driver.find_element(locator)
  end

  def click_by_index(locator, element_index)
    @driver.execute_script("document.getElementsByClassName('#{locator}')[#{element_index}].click();")
  end

  def visit
    @driver.navigate.to 'https://juke.com/'
  end

  def type(locator, input)
    find(locator).send_keys input
  end

  def click_on(locator)
    find(locator).click
  end

  def text(locator)
    find(locator).text
  end

  def quit
    @driver.quit
  end

  def wait_for_text(selector)
    begin
      element = @wait.until { text(selector) != ""}
    ensure
    end
  end

  def find_elements(locator)
    @driver.find_elements(locator)
  end

  def click_on_element_by_index(locator, index)
    find_elements(locator)[index].click
  end

  def current_url
    @driver.current_url
  end

  def url_change(url)
    @wait.until {
      current_url.include?(url)
    }
  end

  def select_from_dropdown(locator, text)
    dropDownMenu = find(locator)
    option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
    option.select_by(:text, text)
  end
end
