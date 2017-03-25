require 'rspec-expectations'

Given /^unregistered user visits juke website/ do
  @driver = Selenium::WebDriver.for :chrome
  @main_page = MainPage.new(@driver)
  @main_page.visit
end

When /^search for "(.*)"/ do |product|
  @main_page.search_product(product)
end

Then /^there is at least one result in the following sections: album, song and movies/ do
  expect(@main_page.products_by_product_type("movie").length).to be > 1
  expect(@main_page.products_by_product_type("album").length).to be > 1
  expect(@main_page.products_by_product_type("song").length).to be > 1
end
