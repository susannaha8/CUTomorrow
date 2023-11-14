# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


courses = Course.create([ {
	:courseSubtitle => "Intro to CS", :courseTitle => "Introduction to Computer Science/ Programming in Java", :courseCode => "1004", :prefixID => 1, :departmentCode => "COMS", :prefixCode => "COMS", :schoolCode => "IF"
}, {
	:courseSubtitle => "Calculus III", :courseTitle => "Calculus III", :courseCode => "1201", :prefixID => 2, :departmentCode => "MATH", :prefixCode => "MATH", :schoolCode => "IF"
}, 
{
	:courseSubtitle => "Calculus IV", :courseTitle => "Calculus IV", :courseCode => "1202", :prefixID => 2, :departmentCode => "MATH", :prefixCode => "MATH", :schoolCode => "IF"
}])
#schedule = Schedule.create([{
#	:uni => "sma2243", :courseID => 1, :reqID => 1, :semester => "F23", :taken => false
#}])
requirements = Requirement.create([
	{:major_minorID => 1, :divisionCode => "CC", :reqType => "major", :reqLabel => "Math Requirement: Calculus", :courses => "MATH 1201|MATH 1202", :numCourses => 1},
	{:major_minorID => 1, :divisionCode => "CC", :reqType => "major", :reqLabel => "CS Core - Intro to CS", :courses => "COMS 1004", :numCourses => 1}
])


majors = Major.create({:name => "Computer Science", :mtype => "major"})

student = Student.create({:uni => "sma2243", :email => "sma2243@columbia.edu", :password => "test"})

# Coursereq.create([
# 	{:reqID => 2, :courseID => 1}, {:reqID => 1, :courseID => 2}, {:reqID => 1, :courseID => 3}
# ])