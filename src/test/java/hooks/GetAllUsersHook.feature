@Ignore
Feature: Get users list

    Scenario: Get users list
        Given url baseUrl
        And path 'api', 'users'
        And param page = pageQueryParam
        When method Get
        Then status 200