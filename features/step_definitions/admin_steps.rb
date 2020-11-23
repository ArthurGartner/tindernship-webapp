Given /the admin account is created/ do
    Account.create(username: "", password: "admin", accountType: 2)
end

Given /the following student accounts are registered/ do |students_table|
  students_table.hashes.each do |student|
    new_student = Student.create(student) 
    account = Account.create(
        username: new_student.firstName + new_student.lastName,
        password: new_student.firstName + new_student.lastName, 
        accountType: 0, 
        account_id: new_student.id)
  end
end


When /^(?:|I )press and confirm delete on Last: "([^"]*)"$/ do |last|
  within ("#students") do   
      accept_confirm do
          find("tr", text: last).find(".delete-account").find_button("Delete").click
      end
  end
end


When /^(?:|I )press and cancel delete on Last: "([^"]*)"$/ do |last|
  within ("#students") do   
      dismiss_confirm do
          find("tr", text: last).find(".delete-account").find_button("Delete").click
      end
  end
end



