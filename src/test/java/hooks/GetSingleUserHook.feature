@Ignore
Feature: Get single User hook

    Background: setup preconditions
        Given url baseUrl
        And path 'api', 'users', id

    Scenario: Get single user hook
        When method Get
        Then status 200