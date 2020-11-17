Feature: Redirect to student page
    As a student
    I want to be automatically redirected to the correct page when I got to the website and am logged in
    So that I don't have to log in every time I view the website

    Background: Student Has Already Setup Account
        Given the student test account is created

    @javascript
    Scenario: Student is redirected to profile page from index
        Given I go to the student login page
        When I fill in "username" with "testaccount@citadel.edu"
        And I fill in "password" with "testaccount"
        And I press "Login"
        Then I should see "Profile for"
        And I go to the splash screen
        Then I should see "Profile for"
        
        