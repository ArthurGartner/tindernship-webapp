Feature: Admin Page
    As an admin
    I want to be able to navigate to an admin page
    So that I can perform administrative tasks

    Background: Admin Setup
        Given the admin account is created
        Given I am on the admin login page
        When I fill in "password" with "admin"
        And I press "Login"
        And the following student accounts are registered:
        
          | firstName | lastName|
          | Rex       | Ferrer  |
          | Paige     | Peck    |
          | Arthur    | Gartner |
          | Hunter    | Ross    |
          | Preston   | Grisham |
          
          
     @javascript
     Scenario: View a table/rows of students
        Given I am on the admin_index page 
        Then I should see "Rex"
        And I should see "Ferrer"
        Then I should see "Arthur"
        And I should see "Gartner"

      @javascript
      Scenario: Admin is redirected to index after logout
        Given the admin account is created
        Given I am on the admin login page
        When I fill in "password" with "admin"
        And I press "Login"
        Then I follow "Log Out"
        Then I should see "Tindernship"
        
   #   @javascript  
   #   Scenario: Delete a student account
   #      Given I am on the admin_index page
   #      When I press and confirm delete on Last: "Ross"
   #      Then I should not see "Hunter"
   #      And I should not see "Ross"
        
   #   @javascript  
   #   Scenario: Cancel delete a student account
   #      Given I am on the admin_index page
   #      When I press and cancel delete on Last: "Peck"
   #      Then I should see "Paige"
   #      And I should see "Peck"
    
   
# TODO(view employers and password resets)

#     Scenario: Reset an employer password
#         Given I am on the admin page
#         When I press "Reset Password" on "EmployerTest"
#         Then I should see "New Password" and "Verify Password"
#         And I fill in "New Password" with "123456789"
#        And I fill in "Verify Password" with "123456789"
#         And I press "Submit"
    
#     Scenario: Reset a student password
#         When I press "Reset Password" on "StudentTest"
#         Then I should see "New Password" and "Verify Password"
#         And I fill in "New Password" with "123456789"
#         And I fill in "Verify Password" with "123456789"
#         And I press "Submit"
        
#     Scenario: View a table/rows of employers
#         Given I am on the admin page
#        And I press "Employer Tab" 
#         Then I should see
        
#    Scenario: Delete an employer account
#         Given I am on the admin page
#         When I press delete on "EmployerTest"
#         Then I should should not see "EmployerTest"
        