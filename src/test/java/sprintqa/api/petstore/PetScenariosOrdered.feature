Feature: Test orchestration feature 

    @pet
    Scenario: Run all of the tests in order

      * call read('PostScenarios.feature')
      * call read('GetScenarios.feature')
      * call read('PutScenarios.feature')
      * call read('DeleteScenarios.feature')