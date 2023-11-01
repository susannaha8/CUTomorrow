class SchedulesController < ApplicationController

  # THIS IS WHERE WE STARTED
  def show
    id = params[:schedID] # retrieve schedID from URI route
    @schedule = Schedule.find(id) # look up schedule by unique ID
    # will render app/views/schedules/show.<extension> by default
  end

  def index
    @major = 1 #will need to get this from profile
    @uni = "sma2243" #will need to get this from profile
    @major_name = "Computer Science"
    @courses = Course.get_courses_by_requirement(2) #required courses
    @schedule = Schedule.where(uni: @uni) #schedule specific to student
  end

  def new
    # default: render 'new' template
  end

  def add_course
   # @display = Schedule.where(taken:false)
    @semester = params[:semester]
    @major = 1 
    @requirements = Requirement.get_requirements_by_major(@major)
    @courses_to_fulfill = {} #hash of requirements and courses to fulfill
    @requirements.each {|i| @courses_to_fulfill[i]=(Course.get_courses_by_requirement(i))}
    #(todo: filter through schedule table)
  end

  def create #ADDED
    @schedule = Schedule.create!(schedule_params)
    flash[:notice] = "Schedule #{@schedule.schedID} was successfully created."
    redirect_to schedule_path
  end

  def edit
    @schedule = Schedule.find params[:schedID]
  end

  def update
    @schedule = Schedule.find(params[:schedID])
    @schedule.update_attributes!(schedule_params)
    flash[:notice] = "Schedule #{@schedule.schedID} was successfully updated."
    redirect_to schedule_path(@schedule)
  end

  def destroy
    @schedule = Schedule.find(params[:schedID])
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







