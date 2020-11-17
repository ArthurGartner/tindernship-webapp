Feature: Clear session cookies upon logout
    As a student
    I want to be able to logout of my account
    So that I am not redirected to my profile page when visiting the website

    Background: Student Has Already Setup Account
        Given the student test account is created

    @javascript
    Scenario: Student is redirected to profile page from index
        Given I go to the student login page
        When I fill in "username" with "testaccount@citadel.edu"
        And I fill in "password" with "testaccount"
        And I press "Login"
        Then I should see "Profile for"
        Then I follow "Log Out"
        Then I should see "Tindernship"