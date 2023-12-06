
# Given /the following schedules are in a Schedule table/ do |schedule_table|
#   schedule_table.hashes.each do |schedule|
#     Schedule.create schedule
#   end
# end

Given /the following (?:.*)s are in a (.*) table/ do |object_name, object_table|
  object_table.hashes.each do |x|
    if (object_name == "Schedule")
      Schedule.create x
    end
    if (object_name == "Course")
      Course.create x
    end
    if (object_name == "Major")
      Major.create x
    end
    if (object_name == "Requirement")
      Requirement.create x
    end
    if (object_name == "Student")
      Student.create x
    end
    if (object_name == "Coursereq")
      Coursereq.create x
    end
  end
end

Given /I login with email (.*) and password (.*)/ do |email, password|
  visit("/login")
  fill_in("email", :with => email)
  fill_in("password", :with => password)
  click_button("Login")
end


And /^I press "([^"]*)" on "([^"]*)"$/ do |action, course_name| #for add and delete course
  row = find("[id='#{course_name}']")
  within(row) do
    click_button(action)
  end
end

When /^(?:|I )follow "([^"]*)" on semester "([^"]*)"$/ do |link, string|
  sem = find("[id='#{string}']")
  within(sem) do
    click_link(link)
  end
end

# Given /the following requirements are in the requirements table/ do |requirement_table|
#   requirement_table.hashes.each do |req|
#     Requirement.create req
#   end
# end

Then /(.*) seed courses should exist/ do | n_seeds |
  expect(Schedule.count).to eq n_seeds.to_i
end

# Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
#   #  ensure that that e1 occurs before e2.
#   #  page.body is the entire content of the page as a string.
#   expect(page.body.index(e1) < page.body.index(e2))
# end

# Then /the director of "(.*)" should be "(.*)"/ do |title, director|
#   step %{I should see "#{title}"}
#   step %{I should see "#{director}"}
# end

# When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
#   rating_list.split(', ').each do |rating|
#     step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
#   end
# end

# Then /I should see all the movies/ do
#   # Make sure that all the movies in the app are visible in the table
#   Movie.all.each do |movie|
#     step %{I should see "#{movie.title}"}
#   end
# end