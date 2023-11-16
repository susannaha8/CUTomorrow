# require 'rails_helper'

describe Course, type: :model do
  describe "GET course" do

    # Course.destroy_all
    # Requirement.destroy_all
    # Coursereq.destroy_all
    # # Course.all 
    # puts Course.all

    before(:each) do
      @course1 = Course.create!({:courseSubtitle => "Calculus III", :courseTitle => "Calculus III", :courseCode => "1201", :prefixID => 2, :departmentCode => "MATH", :prefixCode => "MATH", :schoolCode => "IF"})
      @requirement1 = Requirement.create!({:major_minorID => 1, :divisionCode => "CC", :reqType => "major", :reqLabel => "Math Requirement: Calculus", :courses => "MATH 1201|MATH 1202", :numCourses => 1})
      
      # puts "req " << @requirement1.reqID.to_s
      # puts "course " << @course1.courseID.to_s
      #@coursereq1 = Coursereq.create!({:reqID => @requirement1.reqID, :courseID => @course1.courseID})
    end

    after(:each) do
      Course.destroy_all
      Requirement.destroy_all
      Coursereq.destroy_all
    end

    it "should return courses that fulfill a requirement" do
      
      @ret = Course.get_courses_by_requirement(@requirement1.reqID)
      # puts "ret" << @ret.to_s
      # puts "course all " << Course.all.to_s
      expect(@ret.include?(@course1))
      # @course1.destroy
    end


    before(:each) do
      @course1 = Course.create!({:courseSubtitle => "Calculus III", :courseTitle => "Calculus III", :courseCode => "1201", :prefixID => 2, :departmentCode => "MATH", :prefixCode => "MATH", :schoolCode => "IF"})
      @requirement1 = Requirement.create!({:major_minorID => 1, :divisionCode => "CC", :reqType => "major", :reqLabel => "Math Requirement: Linear Algebra", :courses => "MATH 2001|MATH 2002", :numCourses => 1})
    end

    after(:each) do
      Course.destroy_all
      Requirement.destroy_all
    end

    it "should not return courses that don't fulfill a requirement" do
      @ret = Course.get_courses_by_requirement(@requirement1.reqID)
      expect(@ret).to_not eq([@course1])
      # @course1.destroy
    end

  end

end