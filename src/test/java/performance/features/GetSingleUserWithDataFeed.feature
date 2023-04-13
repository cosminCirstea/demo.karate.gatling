Feature: Get single users in async

    # This is similar to 'Scenario Outline: Get single users in async'
    # However, it makes use of the feed from the users.csv file
    # Long story short, it works like an example table, where the first row is the header, the rest are values
    # The settings are made in the PerfFeederTest.scala file
    Scenario: Get single users in async
        Given url baseUrl
        And path 'api', 'users', __gatling.Id
        When method Get
        Then status 200







