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
	{:major_minorID => 1, :divisionCode => "CC", :reqType => "major", :reqLabel => "Area Foundation Courses", :courses => "COMS 4111|COMS 4113|COMS 4115|COMS 4118|CSEE 4119|COMS 4152|COMS 4156|COMS 4160|COMS 4167|COMS 4170|COMS 4181|CSOR 4231|COMS 4236|COMS 4701|COMS 4705|COMS 4731|COMS 4733|CBMF 4761|COMS 4771|CSEE 4824|CSEE 4868", :numCourses => 3},
	{:major_minorID => 2, :divisionCode => "CC", :reqType => "major", :reqLabel => "Workshop", :courses => "WRIT 1100|WRIT 3134|WRIT 1300|WRIT 2100|WRIT 2200|WRIT 2300|WRIT 3100|WRIT 3200|WRIT 3300|WRIT 3101|WRIT 3201|WRIT 3301", :numCourses => 5},
	{:major_minorID => 2, :divisionCode => "CC", :reqType => "major", :reqLabel => "Seminar", :courses => "WRIT 3121|WRIT 3117|WRIT 3122|WRIT 3120|WRIT 3213|WRIT 3215|WRIT 3216|WRIT 3217|WRIT 2311|WRIT 3313|WRIT 3314|WRIT 4310|WRIT 4011|WRIT 4012|WRIT 3016|WRIT 3013", :numCourses => 4},
	{:major_minorID => 3, :divisionCode => "CC", :reqType => "major", :reqLabel => "Dance History", :courses => "DNCE 2565|DNCE 3001", :numCourses => 2},
	{:major_minorID => 3, :divisionCode => "CC", :reqType => "major", :reqLabel => "Movement Science", :courses => "DNCE 2562|ANAT 2573|DNCE 3144", :numCourses => 1},
	{:major_minorID => 3, :divisionCode => "CC", :reqType => "major", :reqLabel => "Composition", :courses => "DNCE 2563|DNCE 2564|DNCE 3560|DNCE 3565|DNCE 3566", :numCourses => 1},
	{:major_minorID => 3, :divisionCode => "CC", :reqType => "major", :reqLabel => "Senior Work", :courses => "DNCE 3591|DNCE 3592|DNCE 3593", :numCourses => 2}, # need two semesters of one class
	{:major_minorID => 3, :divisionCode => "CC", :reqType => "major", :reqLabel => "Electives", :courses => "DNCE 2570|DNCE 3000|DNCE 3002|DNCE 3200|DNCE 3240|DNCE 3550|DNCE 3567|DNCE 3576|DNCE 3585|DNCE 3800|DNCE 3984|DNCE 2567|DNCE 3340|DNCE 3601|DNCE 3604", :numCourses => 5},
	{:major_minorID => 4, :divisionCode => "CC", :reqType => "major", :reqLabel => "Lecture Studies", :courses => "THTR 3150|THTR 3151", :numCourses => 2},
	{:major_minorID => 4, :divisionCode => "CC", :reqType => "major", :reqLabel => "Theatre Studio Praxis Courses", :courses => "THTR 2120|THTR 2421|THTR 3004|THTR 3200|THTR 3203|THTR 3300|THTR 3301|THTR 3401|THTR 3402|THTR 3403|THTR 3404|THTR 3405|THTR 3406|THTR 3210", :numCourses => 2},
	{:major_minorID => 4, :divisionCode => "CC", :reqType => "major", :reqLabel => "Senior Thesis", :courses => "THTR 3997|THTR 3998", :numCourses => 1},
	{:major_minorID => 4, :divisionCode => "CC", :reqType => "major", :reqLabel => "Senior Classes", :courses => "THTR 2422|THTR 2423|THTR 2424|THTR 2426|THTR 2427|THTR 2425", :numCourses => 2},

])


majors = Major.create([
	{:name => "Computer Science", :mtype => "major"},
	{:name => "Creative Writing", :mtype => "major"},
	{:name => "Dance", :mtype => "major"},
	{:name => "Drama and Theatre Arts", :mtype => "major"}
])

student = Student.create({:firstName => "Susannah", :lastName => "Abrams", :major1 => 1, :uni => "sma2243", :email => "sma2243@columbia.edu", :password => "test"})

# Coursereq.create([
# 	{:reqID => 2, :courseID => 1}, {:reqID => 1, :courseID => 2}, {:reqID => 1, :courseID => 3}
# ])