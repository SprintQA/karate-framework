Feature: GET requests
  Background:
    * url 'https://restful-booker.herokuapp.com'
    * header Accept = 'application/json'
  Scenario: Get request By ID
    Given path '/booking/5'
    When method get
    Then status 200  