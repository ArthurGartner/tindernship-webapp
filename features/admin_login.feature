Feature: Login to admin account
    As an admin
    I want to login into my account
    So I can view and edit accounts

    @javascript
    Scenario: Submit the login form (valid password)
        Given I am on the admin login page
        When I fill in "password" with "test"
        And I press "Login"
        Then I should see "Admin Dashboard"

    @javascript
    Scenario: Submit the login form (invalid password)
        Given I am on the admin login page
        When I fill in "password" with "abc"
        And I press "Login"
        Then I should see "Invalid password"