Feature: Login to student account
    As a student
    I want to login into my account
    So I can edit my information

    Scenario: Navigate to the login page
        Given I am on the splash screen
        When I follow "Student Login"
        Then I should see "Student Login"
        And I should see "Username"

    @javascript
    Scenario: Submit the login form (valid username/password)
        Given I am on the student login page
        When I fill in "username" with "test"
        And I fill in "password" with "test"
        And I press "Login"
        Then I should see "Student Dashboard"

    @javascript
    Scenario: Submit the login form (invalid username/password)
        Given I am on the student login page
        When I fill in "username" with "abc"
        And I fill in "password" with "abc"
        And I press "Login"
        Then I should see "Invalid username or password"