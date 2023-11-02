# require 'rails_helper'

describe Course, type: :model do
  describe "GET course" do

    it "should return courses that fulfill a requirement" do
      @course1 = Course.create!({:courseSubtitle => "Calculus III", :courseTitle => "Calculus III", :courseCode => "1201", :prefixID => 2, :departmentCode => "MATH", :prefixCode => "MATH", :schoolCode => "IF"})
      @requirement1 = Requirement.create!({:major_minorID => 1, :divisionCode => "CC", :reqType => "major", :reqLabel => "Math Requirement: Calculus", :courses => "MATH 1201|MATH 1202", :numCourses => 1})
      @coursereq1 = Coursereq.create!({:reqID => 1, :courseID => 1})
      @ret = Course.get_courses_by_requirement(1)
      expect(@ret).to eq([@course1])
    end

    it "should not return courses that don't fulfill a requirement" do
      @course1 = Course.create!({:courseSubtitle => "Calculus III", :courseTitle => "Calculus III", :courseCode => "1201", :prefixID => 2, :departmentCode => "MATH", :prefixCode => "MATH", :schoolCode => "IF"})
      @requirement1 = Requirement.create!({:major_minorID => 1, :divisionCode => "CC", :reqType => "major", :reqLabel => "Math Requirement: Linear Algebra", :courses => "MATH 2001|MATH 2002", :numCourses => 1})
      @ret = Course.get_courses_by_requirement(1)
      expect(@ret).to_not eq([@course1])
    end

  end

end