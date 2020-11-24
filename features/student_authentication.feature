Feature: Login to student account
    As a student
    I should only see my profile page for privacy

    Background: Student Has Already Setup Account
        Given the student test account is created
        And I am on the student login page
        When I fill in "username" with "testaccount@citadel.edu"
        And I fill in "password" with "testaccount"
        Then I press "Login"

    Scenario: Students Logs In
        Given I am on the splash screen
        When I follow "Student Login"
        Then I should see "Student Login"
        And I should see "Username"
  