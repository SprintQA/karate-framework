Feature: Pet Get Scenarios
    This feature includes scenarios that test the pet RESTFul services' GET requests

    Background:
        * url petstoreUrl
        * configure headers = {Content-Type:'#(contentType)'}
        * def pet = read ('./payloads/pet.json');
        
    @get
    Scenario: Users are able to retrieve pet's information
        Given path '/pet/1'
        When method get
        Then status 200
        And match response.status == "available"