@smoke
Feature: Get users list

    Background: Setup preconditions
        Given url baseUrl
        And path 'api', 'users'
        And param page = '1'

    Scenario: Print users with odd id numbers
        When method Get
        Then status 200
        # In Karate, data responses can be accessed with the 'response' keyword
        # Parent/child data relations can be navigated with the '.' keyword.
        # Deep scanning is also possible in Karate if needed.
        And def users = response.data
        # Filter the users with odd id number and save the results in a new variable called oddUsers
        And def oddUsers = users.filter(x => x.id % 2 == 1)
        And print oddUsers