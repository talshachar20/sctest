require_relative 'base_page'

class MainPage < BasePage
  attr_accessor :driver, :selectors

  def initialize(driver)
    super
    initialize_selectors
  end

  def click_on_register
    click_on selectors[:REGISTER]
  end

  def close_registration_message
    click_on selectors[:CLOSE_REGISTRATION_MESSAGE]
  end

  def get_movie_element_by_index(index)
    click_by_index 'cover-link', index
  end

  def search_product(product)
    type selectors[:SEARCH_FIELD], product
    click_on selectors[:SEARCH_BUTTON]
  end

  def products_by_product_type(product_type)
    case product_type
    when "album"
      find_elements selectors[:COVER_ALBUM]
    when "song"
      find_elements selectors[:COVER_TRACK]
    when "movie"
      find_elements selectors[:COVER_VIDEO]
    end
  end

  def initialize_selectors
    @selectors = {
        REGISTER:  { class: 'easy-register' },
        CLOSE_REGISTRATION_MESSAGE: { css: '[ng-click="$close()"]'},
        SEARCH_FIELD: {id: 'searchfield'},
        SEARCH_BUTTON: {id: 'searchbutton'},
        COVER_ALBUM: {css: "div[class='cover album']"},
        COVER_TRACK: {css: "div[class='cover track']"},
        COVER_VIDEO: {css: "div[class='cover video']"}
    }
  end
end
