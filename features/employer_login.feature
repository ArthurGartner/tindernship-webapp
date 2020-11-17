Feature: Login to employer account
    As an employer
    I want to login into my account
    So I can view student information

    Background: Employer Account Exists
        Given the employer account is created

    Scenario: Navigate to the login page
        Given I am on the splash screen
        When I follow "Employer Login"
        Then I should see "Employer Login"
        And I should see "Password"

    @javascript
    Scenario: Submit the login form (valid password)
        Given I am on the employer login page
        When I fill in "password" with "employer"
        And I press "Login"
        Then I should see "Full and Part Time"

    @javascript
    Scenario: Submit the login form (invalid password)
        Given I am on the employer login page
        When I fill in "password" with "abc"
        And I press "Login"
        Then I should see "Invalid password"