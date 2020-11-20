@javascript
Feature: update student information from student form

  As a student
  So that I can show my latest achievements
  I want to be able to update my profile

Background: student is logged into their account
  Given the following student account is registered:

  | firstName |lastName|graduationYear|bioText|availability|
  | John      |Doe     |2021          |test   |Part time   |

  Given I am on the student login page
  When I fill in "username" with "teststudentaccount"
  And I fill in "password" with "teststudentaccount"
  And I press "Login"
  Then I should see "Profile for"

Scenario: update graduation year
  When I follow "Edit"
  And I select "2022" from "student_graduationYear"
  And I press "Update"
  Then I am on the profile page for John
  And I should see "2022"
  
Scenario: update resume link
  When I follow "Edit"
  And I fill in "student_resumeLink" with "https://go.citadel.edu/"
  And I press "Update"
  Then I am on the profile page for John
  And I follow "resumelink"
  Then I should see "The Citadel"
  
Scenario: Form requires first name and last name fields be filled
  When I follow "Edit"
  And I fill in "student_firstName" with ""
  And I press "Update"
  Then I am on the profile page for John
  And I should see "John"