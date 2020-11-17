Feature: Validate account that is registered
    As the developer,
    So that a student can have their Citadel credentials associated with their account,
    I need to be able to validate new accounts
        
    @javascript
    Scenario: Submit the register form (citadel email not used)
        Given I am on the student register page
        When I fill in "username" with "testaccount@cofc.edu"
        And I fill in "password" with "abc"
        And I press "Register"
        Then I should see "A valid Citadel email must be used for the username"