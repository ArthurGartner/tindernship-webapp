Feature: update student information from student form

  As a student
  So that I can show my latest achievements
  I want to be able to update my profile

Background: student is logged into their account
  Given the following student account is created:

  | firstName |graduationYear|bioText|
  | John      |2021          |test   |

  When I am on the profile page for John
  Then I should see "John"
  And I should see "2021"

Scenario: update graduation year
  When I follow "edit_student"
  And I enter "2022" into the "student_graduation_year" text box
  And I press "update_student"
