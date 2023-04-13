@smoke
Feature: Response time

    Background:
        * def expectedMaxResponseTime = 1000

    Scenario Outline: Get the response time of a request in <delay> seconds
        Given url baseUrl
        And path 'api', 'users'
        # Define the delay param. Using the '<>' to surround a string marks it as a parameter from the example table
        # The scenario will be run for each item from the Examples table to achieve multiple cases
        And param delay = <delay>
        When method Get
        Then status 200
        # Karate provides the 'responseTime' as a way to measure time required to receive the response
        And assert responseTime < expectedMaxResponseTime
        Examples:
            | delay |
            | 0     |
            | 3     |