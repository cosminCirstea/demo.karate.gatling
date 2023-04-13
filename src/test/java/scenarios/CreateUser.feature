@smoke
Feature: Create a user

    Background: Setup preconditions
        Given url baseUrl
        And path 'api', 'users'

    Scenario: Create a new user
        And request {"name": "Plato", "job": "philosopher"}
        When method Post
        # Check that the status code is 201.
        # In Karate, the status keyword does not need a match condition.
        # It has an embedded equals assert, and specifying the expected status code number is enough
        # If you want to check other json fields, you need the 'match' keyword and the syntax is response.<fieldName> as you can see below
        Then status 201
        And match response.name == 'Plato'
        And match response.job == 'philosopher'
        # If you need to check the data structure of a field, # means it is mandatory, ## means it is optional, and you can check
        # The type as well, if it is a string, number, an array or an object, as well as their size.
        # You can also add content validation by either using simple data comparisons like > than 0, or even pass custom functions
        And match response.id == '#string'
        # Karate is a low code library, but it enables the use of both embedded JavaScript functions or Java methods(e.g. those from java.time)
        # Since I am only interested in checking that the user is created today, thus the day and not hours/minutes/miliseconds
        # I create a formatter to parse the dateTime received from the server(response.createdAt) and return it in 'yyyy-MM-dd' format
        * def formatter = java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd")
        * def formattedCreatedDate = java.time.ZonedDateTime.parse(response.createdAt).format(formatter)
        * def expectedCreationDay = java.time.Instant.now().atZone(java.time.ZoneOffset.UTC).format(formatter)
        # Check that the user creation date is today
        And match formattedCreatedDate == expectedCreationDay
        # TIP: if you want to check that the test is not a false positive, you can use the '* print' command
        # You can just uncomment the below and see if the dates match. Print in Karate is like console.log / System.out.print from Javascript/Java
        # * print formattedCreatedDate
        # * print expectedCreationDay