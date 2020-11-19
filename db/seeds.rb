# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


more_students = [
  {:firstName => 'John',  :lastName => 'Doe', :graduationMonth => 'May',
  :graduationYear => 2021, :bioText => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit est sed leo dapibus semper. Etiam ut neque felis. Donec suscipit posuere arcu ut rhoncus. Praesent sit amet urna sem. Duis viverra ligula id erat fermentum malesuada. Duis porta ex eu erat varius maximus. Praesent ornare euismod faucibus. Duis vehicula porttitor sagittis. Praesent lorem lorem, interdum faucibus porta eu, molestie at orci. Praesent volutpat porttitor venenatis.Etiam et sapien nec erat pharetra tristique eu at odio. Nullam non erat interdum, aliquam est sed, sagittis ante. Cras lorem ex, fermentum quis ante sed, porta egestas erat. Aliquam mauris lectus, rhoncus nec nunc vel, laoreet tincidunt ante. Maecenas id lobortis odio. Sed augue urna, tempor tincidunt leo ac, malesuada dictum metus. Donec nec dui pellentesque, iaculis mauris non, consequat felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent laoreet nulla interdum, rutrum leo pharetra, faucibus turpis. Sed sit amet pharetra sem. Aliquam id interdum velit. Morbi ac mi varius, tempor sapien non, mollis ligula. Duis nunc dui, vestibulum vel nisl id, consectetur consectetur lectus. Integer risus ipsum, lacinia ut enim vel, vulputate blandit elit.Vivamus nisi nisi, condimentum non consequat ut, feugiat vitae nisi. Aenean lacinia diam vitae semper egestas. Fusce fermentum, neque at blandit commodo, ligula velit interdum augue, nec consequat lacus nisi in turpis. Cras viverra velit ipsum, nec dignissim massa ultricies pretium. Morbi arcu sem, sodales a dolor vitae, eleifend iaculis massa. Donec ac lacinia nisl. Pellentesque venenatis, metus id malesuada pretium, erat felis interdum sem, vitae maximus orci dui vel mauris. Donec vitae ex rutrum, rutrum lacus eget, aliquam mauris. Aenean eu diam non sem interdum interdum. Maecenas facilisis luctus aliquam. Duis fringilla pretium lectus at efficitur. Duis condimentum auctor bibendum.Ut euismod diam ac risus eleifend consequat. Vestibulum suscipit velit a pellentesque dictum. Nam tincidunt, dolor eu molestie vehicula, libero mi rutrum nunc, id malesuada ipsum libero sit amet massa. Suspendisse luctus auctor dolor sit amet ultrices. Nullam posuere sed lacus quis fermentum. Morbi sagittis nunc porta rhoncus blandit. Sed neque augue, aliquam et massa non, efficitur gravida erat. Nullam nisi lorem, ultricies vitae arcu sit amet, lacinia faucibus dui. Donec vel diam eget massa rutrum pretium in pulvinar turpis. Curabitur lobortis lorem leo, ut ornare metus condimentum vitae. Proin sed tortor nec sem sollicitudin cursus blandit a odio. Vestibulum nec elit orci. Nunc non molestie quam, ac iaculis ipsum. Nulla efficitur lorem ut nisi molestie, ut viverra purus facilisis.Curabitur tincidunt ut ante vel facilisis. Mauris tortor enim, gravida sed dictum vel, varius quis lectus. Etiam a efficitur nunc, a egestas risus. In at vestibulum velit. Vivamus consectetur elit sed neque mollis tincidunt. Donec nec elit tempus, malesuada ligula et, ultrices massa. Suspendisse laoreet ex sit amet lorem volutpat, quis auctor nunc rhoncus.', :locationPreference1 => 'Charleston, SC'}]

more_students.each do |student|
  newStudent = Student.create!(student)
  Account.create!(username: newStudent.firstName + newStudent.lastName, password: "password", accountType: 0, accountId: newStudent.id)
end

Account.create!(username: "", password:"employer", accountType: 1)
Account.create!(username: "", password: "admin", accountType: 2)

newstudent = Student.create!(availability: 'Part time', firstName: "Homer", lastName: "Simpson", locationPreference1: "Springfield")
Account.create!(username: "testaccount", password: "testaccount", accountType: 0, accountId: newstudent.id)
