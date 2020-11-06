Given /the student test account is created/ do
    newstudent = Student.create
    Account.create(username:"testaccount", password:"testaccount", accountType: 0, accountId: newstudent.id)
end
  