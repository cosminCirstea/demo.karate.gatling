@Ignore
Feature: Create User Hook

    Background: Setup preconditions
        Given url baseUrl
        And path 'api', 'users'

    Scenario: Create a new user Hook
        # In karate you can call feature files inside other feature files for reusability. They are called hooks.
        # You can use parameters. For example, if you run this hook by itself, it will fail with nameParam and jobParam undefined
        # However, if you call it in another feature file and provide values for the parameters, you can reuse it
        # TIP: make sure to place parameters inside #() when providing parameters to jsons.
        # Otherwise they will be treated as string literals instead of parameters
        And request {"name": #(nameParam), "job": #(jobParam)}
        When method Post
        Then status 201
        And match response.name == nameParam
        And match response.job == jobParam