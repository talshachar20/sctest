#encoding: utf-8

Feature: This is the search field in the website, tests results given in the main page

  Scenario: Unregistered user search for specific product
    Given unregistered user visits juke website
    When search for "ninja turtles"
    Then there is at least one result in the following sections: album, song and movies
