Given /the following student account is registered/ do |students_table|
  students_table.hashes.each do |student|
    newStudent = Student.create student
    account = Account.create(username: "teststudentaccount", password: "teststudentaccount", accountType: 0, accountId: newStudent.id)
  end
end
