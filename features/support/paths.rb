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

    when /^the schedule page for "(.*)"$/  then
      schedule_path
    when /^I follow "Add Courses" on "(.*)"$/ then
      semester = $1
      add_course_path(semester: semester)  # Pass the semester as a parameter
    when /^the Add Course page for "(.*)"$/  then
      semester = $1
      add_course_path(semester: semester)
    when /^the All Courses page for "(.*)"$/i
      semester = $1
      all_courses_path(semester: semester)
    when /^I follow "+" on "(.*)"$/ then
      schedule_path
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    when /^I follow "Profile" on the (.*)$/ then
      profile_path

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
