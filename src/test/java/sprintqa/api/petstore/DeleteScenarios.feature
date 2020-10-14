Feature: Pet Delete Scenarios
    This feature includes scenarios that test the pet RESTFul services' DELETE requests

    Background:
        * url petstoreUrl
        * configure headers = {Content-Type:'#(contentType)'}
        * def pet = read ('./payloads/pet.json');
        
    @del
    Scenario: Users are able to delete a pet
        Given path '/pet/1'
        * header api_key = 'special-key'
        When method delete
        Then status 200