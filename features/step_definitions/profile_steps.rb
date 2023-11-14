
Given /the following data is in a profile/ do |student_table|
    student_table.hashes.each do |student|
      Student.create student
    end
  end
  
  Given /the following majors are in the major/ do |major_table|
    major_table.hashes.each do |major|
      Major.create major
    end
  end
  
#   Then /(.*) seed courses should exist/ do | n_seeds |
#     expect(Schedule.count).to eq n_seeds.to_i
#   end
  
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