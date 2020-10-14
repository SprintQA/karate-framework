Feature: Pet Put Scenarios
    This feature includes scenarios that test the pet RESTFul services' PUT requests

    Background:
        * url petstoreUrl
        * configure headers = {Content-Type:'#(contentType)'}
        * def pet = read ('./payloads/pet.json');
        
    @put
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