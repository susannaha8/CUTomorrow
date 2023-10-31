class SchedulesController < ApplicationController

  # THIS IS WHERE WE STARTED
  def show
    id = params[:schedID] # retrieve schedID from URI route
    @schedule = Schedule.find(id) # look up schedule by unique ID
    # will render app/views/schedules/show.<extension> by default
  end

  def index
    @schedules = Schedule.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @schedule = Schedule.create!(schedule_params)
    flash[:notice] = "Schedule #{@schedule.schedID} was successfully created."
    redirect_to schedules_path
  end

  def edit
    @schedule = Schedule.find params[:schedID]
  end

  def update
    @schedule = Schedule.find params[:schedID]
    @schedule.update_attributes!(schedule_params)
    flash[:notice] = "Schedule #{@schedule.schedID} was successfully updated."
    redirect_to schedule_path(@schedule)
  end

  def destroy
    @schedule = Schedule.find(params[:schedID])
    @schedule.destroy
    flash[:notice] = "Schedule '#{@schedule.schedID}' deleted."
    redirect_to schedules_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def schedule_params
    params.require(:schedule).permit(:schedID, :uni, :courseID, :semester, :reqID, :taken)
  end

end







