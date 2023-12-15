class SchedulesController < ApplicationController

  before_action :authorized, only: [:index, :add_course, :all_courses]

  def index
    @majorID = (Student.find_by_id(session[:student_id])).major1 
    @uni = (Student.find_by_id(session[:student_id])).uni
    @major = Major.find_by_major_minorID(@majorID)
    @major_name = @majorID ? @major.name : ""
    @schedule = Schedule.get_full_schedule().where(uni: @uni) #schedule specific to student

    @semesters = Schedule.get_semesters().where(uni: @uni)
    @years = [2020, 2021, 2022, 2023, 2024, 2025]
    @options = []
    @years.each {|i| @options.append({:season => 'Fall', :year => i.to_s}) && @options.append({:season => 'Spring', :year => i.to_s})}

  end


  def add_course
    @uni = (Student.find_by_id(session[:student_id])).uni
    @semester = params[:semester]
    @major = (Student.find_by_id(session[:student_id])).major1
    @requirements = Requirement.get_requirements_by_major(@major)
    @courses_to_fulfill = {} #hash of requirements and courses to fulfill
    @requirements.each {|i| @courses_to_fulfill[i]=(Course.get_courses_by_requirement(i))}
  end

  def all_courses
    @uni = (Student.find_by_id(session[:student_id])).uni
    @semester = params[:semester]
    @courses = Course.paginate(page: params[:page])
    if params[:search_by_title] != ""
      @courses = @courses.where("courseCode like ?", 
      "%#{params[:search_by_title]}%").paginate(page: params[:page]) #is this safe against sql injection? not a post, so I think so
    end
  end


  def add_academic_year

    @sem = params[:year]
    @uni = (Student.find_by_id(session[:student_id])).uni

    #get string for academic year
    @season = @sem.split(" ")[0]
    @year = @sem.split(" ")[1].to_i
    if (@season == "Fall")
      @academic_year_str = @year.to_s + " " + (@year + 1).to_s
    else
      @academic_year_str = (@year - 1).to_s + " " + @year.to_s
    end

    #check if semester is already added. if no, add
    @mysem = Schedule.get_semesters().where(uni: @uni, semester: @sem)[0]

    if @mysem
      flash[:notice] = "Semester '#{@mysem.semester}' already added."
    else
      Schedule.create(:uni => @uni, :semester => @sem)
    end

    redirect_to schedule_path
  end


  def create
    @uni = (Student.find_by_id(session[:student_id])).uni
    @my_courses = Schedule.where(uni: @uni)
    @course_ids = @my_courses.pluck(:courseID).map(&:to_s)
    @course_id_to_check = schedule_params[:courseID].to_s
    if @course_ids.include?(@course_id_to_check)
      flash[:notice] = "Course '#{Course.find(@course_id_to_check).courseTitle}' already added."
      redirect_to add_course_path
    else
      @schedule = Schedule.create!(schedule_params)
      flash[:notice] = "Course #{Course.find(schedule_params[:courseID]).courseTitle} was successfully added."
      redirect_to schedule_path
    end
  end

  def destroy
    @id = params[:schedID]
    @schedule = Schedule.find(@id)
    @course_id = @schedule.courseID
    @schedule.destroy
    flash[:notice] = "Course '#{Course.find(@course_id).courseTitle}' deleted."
    redirect_to schedule_path
  end

  def delete_semester
    @uni = (Student.find_by_id(session[:student_id])).uni
    @semester = params[:semester]
    @schedule = Schedule.get_full_schedule().where(uni: @uni).where(semester: @semester)
    

    @schedule.each do |course| 
      @course_to_delete = Schedule.find(course.id)
      @course_to_delete.destroy
    end

    @semester_to_delete = Schedule.get_semesters().where(uni: @uni, semester: @semester)[0]
    @semester_to_delete.destroy

    redirect_to schedule_path

  end



  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def schedule_params
    params.require(:schedule).permit(:schedID, :uni, :courseID, :semester, :reqID, :taken)
  end

end







