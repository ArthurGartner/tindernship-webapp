Feature: Dashboard page
    @javascript
    Scenario: Redirect to splash screen if not logged in
        Given I am on the student dashboard page
        Then I should see "Tindernship"

    @javascript
    Scenario: Logged in as student gets redirected
        Given the student test account is created
        And I am on the student login page
        When I fill in "username" with "testaccount@citadel.edu"
        And I fill in "password" with "testaccount"
        Then I press "Login"
        Then I am on the student dashboard page
        Then I should see "Tindernship"