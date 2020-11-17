Feature: Admin Page
    As an admin
    I want to be able to navigate to an admin page
    So that I can perform administrative tasks

    Background: Admin Account Exists
        Given the admin account is created
    
    Scenario: Delete an employer account
        Given I am on the admin page
        When I press delete on "EmployerTest"
        Then I should should not see "EmployerTest"
    
    Scenario: Delete a student account
        Given I am on the admin page
        When I press delete on "StudentTest"
        Then I should should not see "StudentTest"
    
    Scenario: Reset an employer password
        Given I am on the admin page
        When I press "Reset Password" on "EmployerTest"
        Then I should see "New Password" and "Verify Password"
        And I fill in "New Password" with "123456789"
        And I fill in "Verify Password" with "123456789"
        And I press "Submit"
    
    Scenario: Reset a student password
        When I press "Reset Password" on "StudentTest"
        Then I should see "New Password" and "Verify Password"
        And I fill in "New Password" with "123456789"
        And I fill in "Verify Password" with "123456789"
        And I press "Submit"
        
    Scenario: View a table/rows of employers
        Given I am on the admin page
        And I press "Employer Tab" 
        Then I should see
        
    Scenario: View a table/rows of students
        Given I am on the admin page
        And I press "Student Tab" 
        Then I should see