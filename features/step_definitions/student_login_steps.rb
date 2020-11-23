Given /the student test account is created/ do
    newstudent = Student.create
    Account.create(username:"testaccount@citadel.edu", password:"testaccount", accountType: 0, account_id: newstudent.id)
end
  