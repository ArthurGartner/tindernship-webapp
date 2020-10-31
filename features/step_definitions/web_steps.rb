require 'uri'
require 'cgi'

When /^(?:|I ) am on the profile page for (.*)$/ do |student_name|
  visit student_path(Student.find_by_name(student_name))
end
