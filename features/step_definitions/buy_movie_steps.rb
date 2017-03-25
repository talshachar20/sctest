require 'pry'
require 'rspec-expectations'

Given /^a new user register to juke/ do
  @driver = Selenium::WebDriver.for :chrome
  email = 'demoUser' + 10.times.map{rand(10)}.join + '@gmail.com'
  @main_page = MainPage.new(@driver)
  @main_page.visit
  @main_page.click_on_register
  @register_page = RegisterPage.new(@driver)
  @register_page.register_valid_user(email)
  @main_page.close_registration_message
end

When /^viewing the "(.*)" movie on Film highlights/ do |index|
  @main_page.get_movie_element_by_index(index)
  @product_page = ProductPage.new(@driver)
end

Then /^chosen product is "(.*)"/ do |product|
  product_text = @product_page.product_details
  expect(product_text).to include(product)
end

And /^user can buy the movie in HD via PayPal/ do #Method can be expended by each payment method and it's link
  @product_page.click_on_price_button(1)
  @product_page.choose_payment_metnod('PayPal')
  @product_page.order_product
  expect(@product_page.url_change('www.paypal.com')).to be(true)
end
