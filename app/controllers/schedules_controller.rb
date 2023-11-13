class SchedulesController < ApplicationController

  # THIS IS WHERE WE STARTED

  def index
    @major = 1 #will need to get this from profile
    @uni = "sma2243" #will need to get this from profile
    @major_name = "Computer Science"
    @schedule = Schedule.get_full_schedule().where(uni: @uni) #schedule specific to student
  end

#   def new
#     # default: render 'new' template
#   end

  def add_course
   # @display = Schedule.where(taken:false)
    @semester = params[:semester]
    @major = 1 
    @requirements = Requirement.get_requirements_by_major(@major)
    @courses_to_fulfill = {} #hash of requirements and courses to fulfill
    @requirements.each {|i| @courses_to_fulfill[i]=(Course.get_courses_by_requirement(i))}
    #(todo: filter through schedule table)
  end

  def create
    @uni = "sma2243"
    @my_courses = Schedule.where(uni: @uni)
    @course_ids = @my_courses.pluck(:courseID).map(&:to_s)
    @course_id_to_check = schedule_params[:courseID].to_s
    if @course_ids.include?(@course_id_to_check)
      flash[:notice] = "Course '#{@course_id_to_check}' already added."
      redirect_to add_course_path
    else
      @schedule = Schedule.create!(schedule_params)
      flash[:notice] = "Schedule #{@schedule.schedID} was successfully created."
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
    @schedule.destroy
    flash[:notice] = "Schedule '#{@schedule.schedID}' deleted."
    redirect_to schedule_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def schedule_params
    params.require(:schedule).permit(:schedID, :uni, :courseID, :semester, :reqID, :taken)
  end

end







