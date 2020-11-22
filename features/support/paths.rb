# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    when /^the splash screen$/
      '/'
    when /^the student login page$/
      '/login/student'
    when /^the student register page$/
      '/register'
    when /^the student does not exist page$/
      '/students/0'
    when /^the employer login page$/
      '/login/employer'
    when /^the admin login page$/
      '/admin'

        
    # I go to the student dashboad page
    when /^the student dashboard page$/ then '/dashboard'
    
    when /^the profile page for John$/
        student_path(Student.find_by_firstName("John")[:id])

    when /^the profile page for testaccount$/
        student_path({id: 1})
              
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
