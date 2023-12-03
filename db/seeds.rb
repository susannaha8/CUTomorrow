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
	{:major_minorID => 5, :divisionCode => "CC", :reqType => "major", :reqLabel => "Foundations", :courses => "EESC 2100|EESC 2200", :numCourses => 2},
	{:major_minorID => 5, :divisionCode => "CC", :reqType => "major", :reqLabel => "Mathematics Requirement", :courses => "MATH 1101", :numCourses => 1},
	{:major_minorID => 5, :divisionCode => "CC", :reqType => "major", :reqLabel => "Science Requirement", :courses => "CHEM 1403|CHEM 1404|PHYS 1201|PHYS 1202", :numCourses => 3},
	{:major_minorID => 5, :divisionCode => "CC", :reqType => "major", :reqLabel => "Capstone Experience", :courses => "EESC 3800|EESC 3901|EESC 3801", :numCourses => 1},
	{:major_minorID => 5, :divisionCode => "CC", :reqType => "major", :reqLabel => "Breadth and Related Fields Requirement", :courses => "EESC 2100|EESC 2300|EESC 3010|EESC 3017|EESC 4050|EESC 4600|EESC 4917|EAEE 2002", :numCourses => 2},
	{:major_minorID => 5, :divisionCode => "CC", :reqType => "major", :reqLabel => "Depth Requirement - Foundation", :courses => "EESC 3101|EESC 3201", :numCourses => 1},
	{:major_minorID => 5, :divisionCode => "CC", :reqType => "major", :reqLabel => "Depth Requirement - Additional Courses", :courses => "EESC 4090|EESC 4113|EESC 4223|EESC 4230|EESC 4701|EESC 4887|EESC 4947|EESC 3015|EESC 3016|EESC 3200|EESC 4090|EESC 4113|EESC 4701|EESC 4885|EESC 4887|EESC 4926|EESC 4008|EESC 4920|EESC 4924|EESC 4925|EESC 4926|EESC 4230|EESC 4300|EESC 4937|EESC 4947|EESC 4949|EESC 3015|EESC 3025|EESC 4008|EESC 4330|EESC 4835|EESC GU4920|EESC 4924|EESC 4925|EESC 4937|EESC 4223|EESC 4550|EESC 4920|EESC 4924|EESC 4937", :numCourses => 3},
	{:major_minorID => 6, :divisionCode => "CC", :reqType => "major", :reqLabel => "Foundations", :courses => "EESC 2100|EESC 2200|EESC 2300", :numCourses => 3},
	{:major_minorID => 6, :divisionCode => "CC", :reqType => "major", :reqLabel => "Mathematics Requirement", :courses => "MATH 1101", :numCourses => 1},
	{:major_minorID => 6, :divisionCode => "CC", :reqType => "major", :reqLabel => "Science Requirement", :courses => "CHEM 1403|CHEM 1404|PHYS 1201|PHYS 1202|EEEB 2001", :numCourses => 3},
	{:major_minorID => 6, :divisionCode => "CC", :reqType => "major", :reqLabel => "Capstone Experience", :courses => "EESC 3800|EESC 3801", :numCourses => 1},
	{:major_minorID => 6, :divisionCode => "CC", :reqType => "major", :reqLabel => "Senior Seminar", :courses => "EESC 3901", :numCourses => 1},
	{:major_minorID => 6, :divisionCode => "CC", :reqType => "major", :reqLabel => "Breadth and Related Fields Requirement", :courses => "EESC 3017|EESC 4050|EESC 4600|EESC 4917|EESC 3010", :numCourses => 2},
	{:major_minorID => 6, :divisionCode => "CC", :reqType => "major", :reqLabel => "Depth Requirement - Foundation", :courses => "EESC 3101|EESC 3201", :numCourses => 1},
	{:major_minorID => 6, :divisionCode => "CC", :reqType => "major", :reqLabel => "Depth Requirement - Additional Courses", :courses => "EESC 4076|EESC 4480|EAEE 3221|EESC 3015|EESC 4885|EESC 4887|EESC 4924|EESC 4888|EESC 4926|EESC 4076|EESC 4835|EESC 4885|EESC 3025|EEAE 3221|EESC 4008|EESC 4330|EESC 4920|EESC 4050|EESC 4701|EEAE 2002", :numCourses => 3},
	{:major_minorID => 7, :divisionCode => "CC", :reqType => "major", :reqLabel => "Foundations", :courses => "EESC 2100", :numCourses => 1},
	{:major_minorID => 7, :divisionCode => "CC", :reqType => "major", :reqLabel => "Foundations - Additional Course", :courses => "EESC 1009|EESC 1030|EESC 1201|EESC 1600|EESC 4600|EESC 2200|EESC 2300|EESC 2330", :numCourses => 1},
	{:major_minorID => 7, :divisionCode => "CC", :reqType => "major", :reqLabel => "Core - Paleoclimate Course", :courses => "EESC 4235|EESC 4330|EESC 4480|EESC 4920|EESC 4937", :numCourses => 1},
	{:major_minorID => 7, :divisionCode => "CC", :reqType => "major", :reqLabel => "Core - Modern Climate Course", :courses => "EESC 3109|EESC 4008|EESC 4020|EESC 4040|EESC 4925|EESC 4930", :numCourses => 1},
	{:major_minorID => 7, :divisionCode => "CC", :reqType => "major", :reqLabel => "Core - Additional Course", :courses => "EESC 3109|EESC 3101|EESC 3201|EESC 4220|EESC 4835|EESC 4885|EESC 4923|EESC 4924|EESC 4926|EESC 3400|EESC 4210|EESC 4223|EESC 4230|EESC 4887|EESC 4888", :numCourses => 1},
	{:major_minorID => 7, :divisionCode => "CC", :reqType => "major", :reqLabel => "Climate Solutions, Justice, Policy, and Communication", :courses => "EESC 3045|ARCH 3120|EEAE 2002|EEAE 2100|EEAE 4001|EEAE 4002|EEAE 4006|EEAE 4300|EEAE 4302|EEAE 4301|EEAE 4305|CIEE 3250|MECE 4211|SDEV 4250|ANTH 3932|ANTH 3861|ARCH 3400|ECON 3039|ECON 3040|ECON 2257|ECON 4750|POLS 3648|POLS 4814|POLS 4863|SDEV 3355|SDEV 3360", :numCourses => 1},
	{:major_minorID => 7, :divisionCode => "CC", :reqType => "major", :reqLabel => "Climate System Capstone", :courses => "EESC 3XXX|EESC 3901|EESC 3800", :numCourses => 1},
	{:major_minorID => 8, :divisionCode => "CC", :reqType => "major", :reqLabel => "Language Requirement", :courses => "CHNS 3003|CHNS 3004|CHNS 3005|CHNS 3006|JPNS 3005|JPNS 3006|KORN 3005|KORN 3006|TIBT 3611|TIBT 3612|VIET 3103", :numCourses => 2},
	{:major_minorID => 8, :divisionCode => "CC", :reqType => "major", :reqLabel => "Introductory Course", :courses => "AHUM 1400", :numCourses => 1},
	{:major_minorID => 8, :divisionCode => "CC", :reqType => "major", :reqLabel => "Additional Introductory Course", :courses => "ASCE 1359|ASCE 1361|ASCE 1363|ASCE 1365|ASCE 1367", :numCourses => 2},
	{:major_minorID => 8, :divisionCode => "CC", :reqType => "major", :reqLabel => "Methodology Course", :courses => "EAAS 3990", :numCourses => 1},
	{:major_minorID => 8, :divisionCode => "CC", :reqType => "major", :reqLabel => "Electives", :courses => "EALAC XXXX|AMEC XXXX", :numCourses => 4}, # not certain classes
	{:major_minorID => 9, :divisionCode => "CC", :reqType => "major", :reqLabel => "Introductory Environmental Biology", :courses => "EEEB 2001|EEEB 2002", :numCourses => 2},
	{:major_minorID => 9, :divisionCode => "CC", :reqType => "major", :reqLabel => "Environmental Science", :courses => "EESC 2100|EESC 2200", :numCourses => 2},
	{:major_minorID => 9, :divisionCode => "CC", :reqType => "major", :reqLabel => "Chemistry Requirement", :courses => "CHEM 1403|CHEM 1404", :numCourses => 2},
	{:major_minorID => 9, :divisionCode => "CC", :reqType => "major", :reqLabel => "Physics Requirement", :courses => "PHYS 1201", :numCourses => 1},
	{:major_minorID => 9, :divisionCode => "CC", :reqType => "major", :reqLabel => "Statistics Requirement", :courses => "EEEB 3005|BIOL 2286|STAT 1101|STAT 1201", :numCourses => 1},
	{:major_minorID => 9, :divisionCode => "CC", :reqType => "major", :reqLabel => "Calculus Requirement", :courses => "MATH 1101|MATH 1102|MATH 1201|MATH 1202", :numCourses => 1},
	{:major_minorID => 9, :divisionCode => "CC", :reqType => "major", :reqLabel => "Thesis REsearch Seminar", :courses => "EEEB 3991|EEEB 3992", :numCourses => 2}

])


majors = Major.create([
	{:name => "Computer Science", :mtype => "major"},
	{:name => "Creative Writing", :mtype => "major"},
	{:name => "Dance", :mtype => "major"},
	{:name => "Drama and Theatre Arts", :mtype => "major"},
	{:name => "Drama and Theatre Arts", :mtype => "major"},
	{:name => "Earth Science", :mtype => "major"},
	{:name => "Environmental Science", :mtype => "major"},
	{:name => "Climate System Science", :mtype => "major"},
	{:name => "East Asian Studies", :mtype => "major"},
	{:name => "Environmental Biology", :mtype => "major"}
])

student = Student.create({:firstName => "Susannah", :lastName => "Abrams", :major1 => 1, :uni => "sma2243", :email => "sma2243@columbia.edu", :password => "test"})

# Coursereq.create([
# 	{:reqID => 2, :courseID => 1}, {:reqID => 1, :courseID => 2}, {:reqID => 1, :courseID => 3}
# ])