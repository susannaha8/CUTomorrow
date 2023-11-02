
Given /the following courses are in a schedule/ do |schedule_table|
  schedule_table.hashes.each do |schedule|
    Schedule.create schedule
  end
end

Given /the following courses are in the course directory/ do |course_table|
  course_table.hashes.each do |course|
    Course.create course
  end
end

Given /the following requirements are in the requirements table/ do |requirement_table|
  requirement_table.hashes.each do |req|
    Requirement.create req
  end
end

Given /the following pairs are in coursereqs/ do |course_table|
  course_table.hashes.each do |course|
    Coursereq.create course
  end
end

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