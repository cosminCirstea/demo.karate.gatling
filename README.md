# Demo Karate framework and Gatling on `https://reqres.in/`

### 1. Introduction

The project tests the API of *reqres* and is based on `Maven`, `Karate` and `Gatling`

Karate is a low-code library, but for technical people. Someone less technical can quickly get up to speed and write simpler
API calls, but for more complex situations, technical experience is more than welcome. Karate has a lot of features embedded and can also make use of Java methods or JavaScript functions.

JSON, XML and CSV manipulation, storage, reading can be easily done with Karate. They can be read, modified, validate their data content with functions, use them for schema validation, join them, split them, a lot can be done to meet your objectives.

### 2. What do you need to use it?

- Install following Components: Java OpenJDK and Maven
- Configure Java (set the `PATH` system variable to the `\bin` directory and a `JAVA_HOME` system variable to the main directory of your Java JDK (not JRE)) - on Windows
- Configure Maven (set the `PATH` system variable to the `\bin` directory and a `M2_HOME` system variable to the main directory) - on Windows
- Install the Integrated Development Environment (IDE): `Visual Studio Code` or `IntelliJ IDEA` or `Eclipse`
    - If `Visual Studio Code` is used then install useful extensions (some are necessary for the project, some only optional). You can also find them by writing @recommended in the Search Extensions field from the Extensions tab and they will be displayed as Workspace Recommendations:
        - `Material Icon Theme`
        - `Karate Runner`
        - `Cucumber (Gherkin) Full Support`
        - `GitLens`
        - `Open in Default Browser`
        - `Any Theme you like` - I personally use the GitHub Theme at the moment.
    - If `IntelliJ` is used then install these useful extensions:
        - `Cucumber for Java`
        - `Gherkin`
    
### 3. Project structure

- On the main project path located are files:
    - `.gitignore`
        - Folders and files which shouldn't be pushed to repository
    - `pom.xml`
        - Project configuration in `Maven` (how to build project, get dependencies and plugins)
    - `README.md`
        - Documentation which is needed to know how to use the project
    - `target`
        - All output data after building project and executing tests (including `Karate HTML test report` - see detailed description in another section)
        - Folder shouldn't be in the repository, so the path to it is included in `.gitignore` file
- In src/test/java are files and folders:
    - `karate-config.js`
        - here global running parameters can be setup, authorization, environment, any global variables or urls
    - `logback-test.xml`
        - file for Karate reporting
    - `TestRunner.java`
        - for running tests in Karate, specifying on how many threads features can be run, generate Karate reports and the path to the feature files
    - `scenarios` folder
        - containing feature files with the Karate Scenarios
    - `hooks` folder
        - containing feature files that are used for code reusability by being called into other feature files
    - `performance` folder
        - containing the Gatling integration to Karate for performance testing
            -  `data`
                - feeds to be used in the scenarios. Can be csv, xml, json
            - `features`
                - Karate feature files to be used for performance testing with Gatling
            - `simulations`
                - test runners for performance testing to specify which feature files to use, data feeds and performance variables like concurrent users, rampUp, duration, etc.

### 4. How to execute the functional tests

- Open terminal and change current working directory to the `DEMO.KARATE.GATLING` location
- Possible commands to execute tests with description
    - `mvn clean test`
        - Run all tests in the project in default `dev` environment
    - `mvn clean test "-Dkarate.env=dev"`
        - Run all tests in the project in default `dev` environment

    - `mvn clean test "-Dkarate.options=--tags @smoke" "-Dkarate.env=dev" -Dtest=TestRuner`
        - Run only tests which are tagged as `smoke` (in specific feature file) in specified `dev` environment and included for `TestRuner` test runner(useful when you have multiple environments and/or Test runners)
- Commands can be prepared according to needs and based on the examples presented above in specific combination
    - `-Dkarate.options` (according to `tags` for feature or scenario)
    - `-Dkarate.env` (according to `karate-config.js`)
    - `-Dtest` (according to `test runner java file`)

### 5. How to execute the performance tests

- Open terminal and change current working directory to the `DEMO.KARATE.GATLING` location
- Possible commands to execute tests with description
    - `mvn clean test-compile gatling:test`
        - To run all simulation files

### 6. Karate HTML test report

- After running and executing functional tests from the validations folder the `karate-reports` folder is created on the `target` location
- To see the report go to the `\target\karate-reports\` location and open the `karate-summary.html` file
- You can also access it from the KARATE RUNNER tab

### 7. Cucumber html test report

- After running and executing functional tests from the validations folder the `cucumber-html-reports` folder is created on the `target` location
- To see the report go to the `\target\cucumber-html-reports\` location and open the `overview-features.html` file
- You can also access it from the KARATE RUNNER tab

### 8. Gatling test report

- After running and executing performance tests from the performance folder the `gatling` folder is created on the `target` location
- To see the report go to the `\target\gatling\{testRunnerName}` location and open the `index.html` file
- You can also access it from the KARATE RUNNER tab, but you won't know which report corresponds to which run
        
### 9. More detailed informations about how to use Karate with additional useful examples

- [Go to Karate official Github page documentation](https://github.com/karatelabs/karate)
        
### 10. Additional information about used dependencies and plugins in the "pom.xml" configuration file for the project

- karate-junit5 and karate-gatling
    - Copyright 2017 Intuit Inc.
    - [MIT License](https://github.com/karatelabs/karate/blob/master/LICENSE)
    - [GitHub repository](https://github.com/karatelabs/karate)

- maven-compiler-plugin
    - Copyright © 2001–2019 The Apache Software Foundation
    - [APACHE LICENSE, VERSION 2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
    - [Home page](https://maven.apache.org/plugins/maven-compiler-plugin/)

- maven-surefire-plugin
    - Copyright © The Apache Software Foundation
    - [APACHE LICENSE, VERSION 2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
    - [Home page](https://maven.apache.org/surefire/maven-surefire-plugin/)

- cucumber reporting 
    - [GNU Lesser General Public License v2.1](https://github.com/damianszczepanik/cucumber-reporting/blob/master/LICENCE)
    - [Home page](https://github.com/damianszczepanik/cucumber-reporting)

- gatling maven plugin
    - [Apache License 2.0](https://github.com/gatling/gatling-maven-plugin/blob/main/LICENSE.txt)
    - [Home page](https://gatling.io/docs/gatling/reference/current/extensions/maven_plugin/)
    - [Github](https://github.com/gatling/gatling-maven-plugin)

- scala maven plugin
    - [The Unlicense](https://github.com/davidB/scala-maven-plugin/blob/master/UNLICENSE)
    - [Github](https://github.com/davidB/scala-maven-plugin)