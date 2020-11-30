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
4. The Travis CI tool builds and runs the tests automatically on every push to main, every branch that has been pushed, etc., then it updates the badge in the README (see above) on whether the main build is passing or failing. It takes currently about an hour for the tool to run through and fail before running the tests. 

# Additional information
This application was built using Ruby v2.6.6 with Rails 6.0.3.4. 

[Travis CI](https://travis-ci.org/CitadelCS/tindernship) is currently failing on all builds. Currently it is failing due to a Webpacker error that was resolved on our own code base, but hasn't been resolved in the travis environment. There has been some research into fixing this, but as it takes roughly an hour to see if a fix works, time ran out on getting it up and running. The travis.yml file is where the fix will most likely need to be done. Some links that I would recommend looking at when starting to get it fixed would be the following: 

* [Travis CI: Building a JavaScript and Node.js project](https://docs.travis-ci.com/user/languages/javascript-with-nodejs/)

* [What is the required setup of Travis when using webpacker on Rails 5?](https://stackoverflow.com/questions/52368188/what-is-the-required-setup-of-travis-when-using-webpacker-on-rails-5)

* [Travis failing with webpacker issue (Rspec) rails 5.2](https://stackoverflow.com/questions/54272210/travis-failing-with-webpacker-issue-rspec-rails-5-2)


# Current status
[Heroku Link](https://tindernship-csci-fall-2020.herokuapp.com/)

[Pivotal Tracker Link](https://www.pivotaltracker.com/n/projects/2472320)

Travis CI build currently failing. See above in addition information. 
