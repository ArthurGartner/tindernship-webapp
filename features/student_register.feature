Feature: Register a student account
    As a student
    I want to register an account
    So I can make a profile

    Scenario: Navigate to the register page
        Given I am on the splash screen
        When I follow "Student Login"
        Then I follow "Register"
        And I should see "Student Register"

    @javascript
    Scenario: Submit the register form (valid username/password)
        Given I am on the student register page
        When I fill in "username" with "test"
        And I fill in "password" with "test"
        And I press "Register"
        Then I should see "Student Dashboard"

    @javascript
    Scenario: Submit the register form (username already taken)
        Given I am on the student register page
        When I fill in "username" with "abc"
        And I fill in "password" with "abc"
        And I press "Register"
        Then I should see "Username is already taken"