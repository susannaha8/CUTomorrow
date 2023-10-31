class CoursesController < ApplicationController
  def index
    # want to display the Major, Requirements, and Classes in the view
    @major = 1 #will need to get this from profile
    @uni = "sma2243" #will need to get this from profile
    @major_name = "Computer Science"
    @requirements = Requirement.get_requirements_by_major(@major)
    @courses = Course.get_courses_by_requirement(3)
    @schedule = Schedule.all
  end
end
