require_relative 'base_page'

class ProductPage < BasePage
  attr_accessor :driver, :selectors

  def initialize(driver)
    super
    initialize_selectors
  end

  def product_details
    wait_for_text(selectors[:PRODUCT_DETAILS])
    text selectors[:PRODUCT_DETAILS]
  end

  def click_on_price_button(index)
    click_on_element_by_index(selectors[:PRICE_BUTTON], 0)
  end

  def choose_payment_metnod(payment_method)
    select_from_dropdown(selectors[:PAYMENT_DROPDOWN], payment_method)
  end

  def order_product
    click_on selectors[:ORDER_BUTTON]
  end

  def initialize_selectors
    @selectors = {
        PRODUCT_DETAILS:  { class: 'info-detail-section' },
        PRICE_BUTTON: {class: 'price-button'},
        PAYMENT_DROPDOWN: {id: 'purchase-start-payment-options'},
        ORDER_BUTTON: {id: 'payPayPalBtn'}
    }
  end
end
