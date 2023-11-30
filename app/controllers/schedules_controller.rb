class SchedulesController < ApplicationController

  before_action :authorized, only: [:index, :add_course]
  # THIS IS WHERE WE STARTED

  def index
    @majorID = (Student.find_by_id(session[:student_id])).major1 
    @uni = (Student.find_by_id(session[:student_id])).uni
    @major = Major.find_by_major_minorID(@majorID)
    @major_name = @majorID ? @major.name : ""
    @schedule = Schedule.get_full_schedule().where(uni: @uni).where.not(course: nil) #schedule specific to student

    @semesters = Schedule.get_semesters().where(uni: @uni)
    @years = [
      { id: 1, name: "2020-2021" },
      { id: 2, name: "2021-2022" },
      { id: 3, name: "2022-2023" },
      { id: 4, name: "2023-2024" },
    ]

  end

#   def new
#     # default: render 'new' template
#   end

  def add_course
   # @display = Schedule.where(taken:false)
    @uni = (Student.find_by_id(session[:student_id])).uni
    @semester = params[:semester]
    # puts "SEM!!!! " << @semester
    # so the sem is marked by whichever one you click on in the view. correct

    @major = (Student.find_by_id(session[:student_id])).major1
    @requirements = Requirement.get_requirements_by_major(@major)
    @courses_to_fulfill = {} #hash of requirements and courses to fulfill
    @requirements.each {|i| @courses_to_fulfill[i]=(Course.get_courses_by_requirement(i))}
    #(todo: filter through schedule table)
  end

  def add_academic_year
    # need to parse the academic year into 2 semesters (fall spring)
    @academic_years = []
    @academic_years.append(params[:year])
    @uni = (Student.find_by_id(session[:student_id])).uni

    puts "AY" << @academic_years.to_s



    @academic_years.each do |year|
      # puts "YEAR   " << year.to_s.split("-").to_s
      @text = year.to_s.split("-")

      # puts 
      

      Schedule.create(:uni => @uni, :semester => "Fall " + @text[0])   
      Schedule.create(:uni => @uni, :semester => "Spring " + @text[1])  
    end

 
    
    # # Add fall semester
    # add_semester_to_schedule(@selected_academic_year, 'Fall')

    # # Add spring semester
    # add_semester_to_schedule(@selected_academic_year, 'Spring')

    redirect_to schedule_path
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
      puts "111111111111 Create action params: #{schedule_params}"
      @schedule = Schedule.create!(schedule_params)
      puts "2222 ELLOOOOOO!!!!! " << schedule_params.to_s
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


  # def add_semester_to_schedule(academic_year, semester)
  #   @uni = (Student.find_by_id(session[:student_id])).uni
  #   @major = (Student.find_by_id(session[:student_id])).major1
  #   @requirements = Requirement.get_requirements_by_major(@major)

  #   # Loop through requirements and add courses to the schedule
  #   @requirements.each do |requirement|
  #     courses = Course.get_courses_by_requirement(requirement)
  #     courses.each do |course|
  #       schedule_params = {
  #         uni: @uni,
  #         courseID: course.courseID,
  #         semester: "#{semester} #{academic_year}",  # Example: "Fall 2022"
  #         reqID: requirement.reqID,
  #         taken: false
  #       }

  #       # Check if the course is already in the schedule
  #       unless Schedule.exists?(uni: @uni, courseID: course.courseID, semester: "#{semester} #{academic_year}")
  #         Schedule.create!(schedule_params)
  #       end
  #     end
  #   end
  # end

end







