# README

This README would normally document whatever steps are necessary to get the
application up and running.

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
# Tindernship
[Heroku Link](https://tindernship-csci-fall-2020.herokuapp.com/)

[Pivotal Tracker Link](https://www.pivotaltracker.com/n/projects/2472320)
