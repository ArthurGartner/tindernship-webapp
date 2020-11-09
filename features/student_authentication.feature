Feature: Login to student account
    As a student
    I should only see my profile page for privacy

    Background: Student Has Already Setup Account
        Given the student test account is created

    Scenario: Students Logs In
        Given I am logged in as a student
        When I follow "Student Login"
        Then I should see "Student Login"
        And I should see "Username"