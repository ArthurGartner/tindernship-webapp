Feature: update student information from student form

  As a student
  So that I can show my latest achievements
  I want to be able to update my profile

Background: student is logged into their account
  Given the following student account is created:

  | name     |graduation_year|additional_information|
  | John Doe |2021           |test|

  And I am on the John's profile page
  Then I should see the "Edit" button

Scenario: update graduation year from 2021 to 2022
  When I check the following
