# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

more_students = [
  {:firstName => 'John',  :lastName => 'Doe', :graduationMonth => 'May',
  :graduationYear => 2021, :bioText => 'Sample Text', :locationPreference1 => 'Charleston, SC'}]

more_students.each do |student|
  newStudent = Student.create!(student)
  Account.create!(username: newStudent.firstName + newStudent.lastName, password: "password", accountType: 0, accountId: newStudent.id)
end

Account.create!(username: "", password: "employer", accountType: 1)
Account.create!(username: "", password: "admin", accountType: 2)

newstudent = Student.create!(availability: 'Part time', firstName: "Homer", lastName: "Simpson", locationPreference1: "Springfield")
Account.create!(username: "testaccount", password: "testaccount", accountType: 0, accountId: newstudent.id)
