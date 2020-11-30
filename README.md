# Tindernship [![Build Status](https://travis-ci.org/CitadelCS/tindernship.svg?branch=main)](https://travis-ci.org/CitadelCS/tindernship)

Tindernship aims to provide The Citadel Computer Science department with a capability allowing companies to quickly review and evaluate computer science undergraduates using a web-based application. Employers can view all student profiles using a shared password that is given by the application admin. Employers can also sort the available students based on their desired attributes. Students, using their citadel email address, can sign up on the site and update their profiles with relevant information. Student can only view and edit their own profiles, only employers and administrators can view other student profiles. Administrators can also reset passwords for both employers and students and can edit or delete individual student profiles at will.

# Get started in Codio and Install Chrome Binary to run feature tests

You will need to run the install_chrome.sh script to install Chrome binary before running feature tests:

1. Make the install_chrome script executable with command: chmod +x install_chrome.sh
2. Run the script with command: ./install_chrome.sh
3. Run command: bundle install --without production
4. Run command: bundle exec rake db:migrate db:test:prepare db:seed
5. Run command: bundle exec cucumber

# To test Tindernship login and features

1. To test student accounts - click student login & then register a new account. You should only be able to view a profile for the user logged in.
2. To test employer account - click Employer Login and user the password 'employer'
3. To test admin account - go to route /admin and use the password 'admin'

  TRAVIS CI INSTALL INSTRUCTIONS???

# Additional information
This application was built using Ruby v2.6.6 with Rails 6.0.3.4. 

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# Current status
[Heroku Link](https://tindernship-csci-fall-2020.herokuapp.com/)

[Pivotal Tracker Link](https://www.pivotaltracker.com/n/projects/2472320)

Travis CI build currently failing....
