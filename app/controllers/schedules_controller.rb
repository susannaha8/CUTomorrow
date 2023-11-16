class SchedulesController < ApplicationController

  before_action :authorized, only: [:index, :add_course]
  # THIS IS WHERE WE STARTED

  def index
    @majorID = (Student.find_by_id(session[:student_id])).major1 
    @uni = (Student.find_by_id(session[:student_id])).uni
    @major = Major.find_by_major_minorID(@majorID)
    @major_name = @majorID ? @major.name : ""
    @schedule = Schedule.get_full_schedule().where(uni: @uni) #schedule specific to student
  end

#   def new
#     # default: render 'new' template
#   end

  def add_course
   # @display = Schedule.where(taken:false)
    @uni = (Student.find_by_id(session[:student_id])).uni
    @semester = params[:semester]
    @major = (Student.find_by_id(session[:student_id])).major1
    @requirements = Requirement.get_requirements_by_major(@major)
    @courses_to_fulfill = {} #hash of requirements and courses to fulfill
    @requirements.each {|i| @courses_to_fulfill[i]=(Course.get_courses_by_requirement(i))}
    #(todo: filter through schedule table)
  end

  def create
    # puts "Ello " << session[:student_id].to_s

    @uni = (Student.find_by_id(session[:student_id])).uni
    @my_courses = Schedule.where(uni: @uni)
    @course_ids = @my_courses.pluck(:courseID).map(&:to_s)
    @course_id_to_check = schedule_params[:courseID].to_s
    if @course_ids.include?(@course_id_to_check)
      flash[:notice] = "Course '#{Course.find(@course_id_to_check).courseTitle}' already added."
      redirect_to add_course_path
    else
      @schedule = Schedule.create!(schedule_params)
      # puts "ELLOOOOOO!!!!! " << schedule_params.to_s
      flash[:notice] = "Course #{Course.find(schedule_params[:courseID]).courseTitle} was successfully added."
      redirect_to schedule_path
    end
  end

#   def update
#     @schedule = Schedule.find(params[:schedID])
#     @schedule.update_attributes!(schedule_params)
#     flash[:notice] = "Schedule #{@schedule.schedID} was successfully updated."
#     redirect_to schedule_path(@schedule)
#   end

  def destroy
    @id = params[:schedID]
    @schedule = Schedule.find(@id)
    @course_id = @schedule.courseID
    @schedule.destroy
    flash[:notice] = "Course '#{Course.find(@course_id).courseTitle}' deleted."
    redirect_to schedule_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def schedule_params
    params.require(:schedule).permit(:schedID, :uni, :courseID, :semester, :reqID, :taken)
  end

end







