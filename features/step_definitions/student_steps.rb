Given /the following student account is created/ do |students_table|
  students_table.hashes.each do |student|
    Student.create student
  end
end
