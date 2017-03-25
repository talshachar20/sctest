#encoding: utf-8

Feature: This feature tests main flows of juke application, such as register and
purchase a movie from the list with different payment methods

  Scenario: Register and purchase movie with Paypal
    Given a new user register to juke
    When viewing the "11" movie on Film highlights
    Then chosen product is "Teenage Mutant Ninja Turtles: Out Of The Shadows"
    And user can buy the movie in HD via PayPal
