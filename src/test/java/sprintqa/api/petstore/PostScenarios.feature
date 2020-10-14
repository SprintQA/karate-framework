Feature: Pet Post Scenarios
    This feature includes scenarios that test the pet RESTFul services' POST requests

    Background:
        * url petstoreUrl
        * configure headers = {Content-Type:'#(contentType)'}
        * def pet = read ('./payloads/pet.json');
        
    @post
    Scenario: Users are able to add pets to the system
        Given path '/pet'
        And request pet
        When method post
        Then status 200
        And match response.id == '#notnull'
        And match response.name == "doggie"
        And match response.status == "available"