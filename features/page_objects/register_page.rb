require_relative 'base_page'

class RegisterPage < BasePage
  attr_accessor :driver, :selectors

  def initialize(driver)
    super
    initialize_selectors
  end

  def register_valid_user(email)
    type selectors[:FIRST_NAME], 'test'
    type selectors[:LAST_NAME], 'test'
    type selectors[:EMAIL], email
    type selectors[:EMAIL_CONFIRM], email
    type selectors[:PASSWORD], 'Test12345678'
    click_on selectors[:SUBMIT]
    find selectors[:SUCCESS]
  end

  def initialize_selectors
    @selectors = {
        FIRST_NAME:  { id: 'firstName' },
        LAST_NAME:  { id: 'lastName' },
        EMAIL:  { id: 'email' },
        EMAIL_CONFIRM:  { id: 'confirmEmail' },
        PASSWORD: {id: 'password'},
        SUBMIT: {id: 'btnRegisterSubmitForm'},
        SUCCESS: {css: '[ng-click="$ctrl.redirectToFlatRate()"]'}
    }
  end
end
