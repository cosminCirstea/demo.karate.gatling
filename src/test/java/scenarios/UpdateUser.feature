@smoke
Feature: Update a user

    # Background is in Karate similar to the @Before / BeforeEach from JUnit / Cucumber / Plawyright
    Background: Setup preconditions
        # Create a user to make sure there is one to update
        # Retrieve its id to pass to the Patch request
        * def createdUserResult = call read(hooksPath + 'CreateUserHook.feature') {nameParam: "Batman", jobParam: "Superhero"}
        * def createdUserId = createdUserResult.response.id
        # Define the Base Url and the path of the API request for Scenarios
        Given url baseUrl
        And path 'api', 'users', createdUserId

    Scenario: Update a user through PATCH
        * def requestBody = {"name": "Always Batman"}
        And request requestBody
        When method Patch
        Then status 200
        And match response contains requestBody
        And match response.name == "Always Batman"
        And match response.job == '#notpresent'

    Scenario: Update a user through PUT
        * def requestBody = {"name": "Always Batman", "job": "Super Superhero"}
        And request requestBody
        When method PUT
        Then status 200
        And match response contains requestBody
        And match response.name == "Always Batman"
        And match response.job == "Super Superhero"

