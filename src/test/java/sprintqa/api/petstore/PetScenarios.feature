Feature: Pet Scenarios
    This feature includes scenarios that test the pet RESTFul services

    Background:
        * url petstoreUrl
        * configure headers = {Content-Type:'#(contentType)'}
        * def pet = read ('./payloads/pet.json');
        
    Scenario: Users are able to add pets to the system
        Given path '/pet'
        And request pet
        When method post
        Then status 200
        And match response.id == '#notnull'
        And match response.name == "doggie"
        And match response.status == "available"

    Scenario: Users are able to retrieve pet's information
        Given path '/pet/1'
        When method get
        Then status 200
        And match response.status == "available"

     Scenario: Users are able to update an existing pet
        Given path '/pet'
        And request pet
        * set pet.tags[0].name = 'fluffy'
        * set pet.status = 'sold'
        When method put
        Then status 200
        And match response.id == '#notnull'
        And match response.name == "doggie"
        And match response.tags[0].name == "fluffy"
        And match response.status == "sold"

     Scenario: Users are able to delete a pet
        Given path '/pet/1'
        * header api_key = 'special-key'
        When method delete
        Then status 200
