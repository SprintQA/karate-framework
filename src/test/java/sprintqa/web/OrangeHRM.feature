Feature: OrangeHRM demo

  Background:
    * configure driver = { type: 'chrome' }
    
  Scenario: Login to OrangeHRM website with Admin credentials

    Given driver 'https://opensource-demo.orangehrmlive.com'
    And input('input[name=txtUsername]', 'Admin2')
    And input('input[name=txtPassword]', 'admin123')
    When click('#btnLogin')
    Then waitForUrl('https://opensource-demo.orangehrmlive.com/index.php/dashboard')   