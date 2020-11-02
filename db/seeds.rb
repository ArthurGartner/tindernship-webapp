# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

more_students = [
  {:firstName => 'John',  :lastName => 'Doe', :graduationMonth => 6,
  :graduationYear => 2021, :bioText => 'Sample Text', :locationPreference1 => 'Charleston, SC',
  :fullTime => false, :partTime => true}
]

more_students.each do |student|
  Student.create!(student)
end
