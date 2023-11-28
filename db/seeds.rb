# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

records = JSON.parse(File.read('course_reduced.json'))
records.each do |record|
  Course.create!(record)
end

# courses = Course.create([ {
# 	:courseSubtitle => "Intro to CS", :courseTitle => "Introduction to Computer Science/ Programming in Java", :courseCode => "1004", :prefixID => 1, :departmentCode => "COMS", :prefixCode => "COMS", :schoolCode => "IF"
# }, {
# 	:courseSubtitle => "Calculus III", :courseTitle => "Calculus III", :courseCode => "1201", :prefixID => 2, :departmentCode => "MATH", :prefixCode => "MATH", :schoolCode => "IF"
# }, 
# {
# 	:courseSubtitle => "Calculus IV", :courseTitle => "Calculus IV", :courseCode => "1202", :prefixID => 2, :departmentCode => "MATH", :prefixCode => "MATH", :schoolCode => "IF"
# }])
#schedule = Schedule.create([{
#	:uni => "sma2243", :courseID => 1, :reqID => 1, :semester => "F23", :taken => false
#}])
requirements = Requirement.create([
	{:major_minorID => 1, :divisionCode => "CC", :reqType => "major", :reqLabel => "Calculus 3/ Multivariable Calculus", :courses => "MATH 1201|MATH 1205|APMA 2000", :numCourses => 1},
	{:major_minorID => 1, :divisionCode => "CC", :reqType => "major", :reqLabel => "Linear Algebra", :courses => "COMS 3251|APMA 3101|APMA 2101|MATH 2010|MATH 2015", :numCourses => 1},
	{:major_minorID => 1, :divisionCode => "CC", :reqType => "major", :reqLabel => "Probability", :courses => "STAT 1201|STAT 4001|IEOR 3658|MATH 2015", :numCourses => 1},
	{:major_minorID => 1, :divisionCode => "CC", :reqType => "major", :reqLabel => "CS Core", :courses => "COMS 1004|COMS 3134|COMS 3157|COMS 3203|COMS 3261|CSEE 3827", :numCourses => 6},
	{:major_minorID => 1, :divisionCode => "CC", :reqType => "major", :reqLabel => "Area Foundation Courses", :courses => "COMS 4111|COMS 4113|COMS 4115|COMS 4118|CSEE 4119|COMS 4152|COMS 4156|COMS 4160|COMS 4167|COMS 4170|COMS 4181|CSOR 4231|COMS 4236|COMS 4701|COMS 4705|COMS 4731|COMS 4733|CBMF 4761|COMS 4771|CSEE 4824|CSEE 4868", :numCourses => 3}
])


majors = Major.create({:name => "Computer Science", :mtype => "major"})

student = Student.create({:firstName => "Susannah", :lastName => "Abrams", :major1 => 1, :uni => "sma2243", :email => "sma2243@columbia.edu", :password => "test"})

# Coursereq.create([
# 	{:reqID => 2, :courseID => 1}, {:reqID => 1, :courseID => 2}, {:reqID => 1, :courseID => 3}
# ])