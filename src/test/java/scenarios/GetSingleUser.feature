@smoke
Feature: Get single user

    Scenario Outline: Get single user with the id <id> in async
        # When using Scenario Outline and Examples, Karate sends the requests asynchronously.
        # Karate enables reuse of features and parameters.
        # Thus I am passing the id values to the id parameter in the GetSingleUserHook.feature
        * call read(hooksPath + 'GetSingleUserHook.feature') {id: #(id)}
        Examples:
            | id |
            | 1  |
            | 2  |
            | 3  |
            | 4  |
            | 5  |
            | 6  |
            | 7  |
            | 8  |
            | 9  |
            | 10 |

    Scenario: Get single user consecutively
        # This does not do asynchronous requests, but I believe it is something very usable in real-life scenarios
        # I get the first 2 pages of users, join them in a new json, then cut the last 2 entries so I get a json with 10 entries
        # Afterwards I am passing the json to the feature call. In Karate you can use parameters that have the same name as fields from the passed json
        # And it automatically knows to parse over each entry in a for each loop to send parameterised requests
        # In this example, I am sending the data object with the id, name, job from the user and only make use of the id in my new request
        # However, if GetSingleUserHook would have need of name and job, I could have just placed them accordingly in the feature file
        # And when the json is passed on a feature call read, Karate knows where to place the values on each request sent. Quite a cool feature
        Given def getUserList1 = call read(hooksPath + 'GetAllUsersHook.feature') {pageQueryParam: 1}.response.data
        And def getUserList2 = call read(hooksPath + 'GetAllUsersHook.feature') {pageQueryParam: 2}.response.data
        And def joinUserLists = karate.append(getUserList1.response.data, getUserList2.response.data)
        And def getFirstTenUsersList = joinUserLists.slice(0, 10)
        * call read(hooksPath + 'GetSingleUserHook.feature') getFirstTenUsersList





