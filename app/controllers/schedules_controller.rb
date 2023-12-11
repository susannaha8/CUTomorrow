class SchedulesController < ApplicationController

  before_action :authorized, only: [:index, :add_course, :all_courses]

  def index
    @majorID = (Student.find_by_id(session[:student_id])).major1 
    @uni = (Student.find_by_id(session[:student_id])).uni
    @major = Major.find_by_major_minorID(@majorID)
    @major_name = @majorID ? @major.name : ""
    @schedule = Schedule.get_full_schedule().where(uni: @uni) #schedule specific to student

    @semesters = Schedule.get_semesters().where(uni: @uni)
    @years = [
      { id: 1, name: "2020-2021" },
      { id: 2, name: "2021-2022" },
      { id: 3, name: "2022-2023" },
      { id: 4, name: "2023-2024" },
    ]

  end

  #ask: repeating @uni variable
  #add_course and all_courses in courses controller
  def add_course
    @uni = (Student.find_by_id(session[:student_id])).uni
    @semester = params[:semester]
    # puts "SEM!!!! " << @semester
    # so the sem is marked by whichever one you click on in the view. correct

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
    # need to parse the academic year into 2 semesters (fall spring)
    @academic_years = []
    @academic_years.append(params[:year])
    @uni = (Student.find_by_id(session[:student_id])).uni

    puts "AY" << @academic_years.to_s



    @academic_years.each do |year|
      # puts "YEAR   " << year.to_s.split("-").to_s
      @text = year.to_s.split("-")


      
      # @current_semester= Schedule.get_semesters().where(uni: @uni, semester: @semester)[0]
      @fall_semester= Schedule.get_semesters().where(uni: @uni, semester: "Fall " + @text[0])[0]
      @spring_semester = Schedule.get_semesters().where(uni: @uni, semester: "Spring " + @text[1])[0]

      puts "FALL SEM " << @fall_semester.to_s
      puts "SPRING SEM" << @spring_semester.to_s

      if @fall_semester
        flash[:notice] = "Semester '#{@fall_semester.semester}' already added."
      else
        Schedule.create(:uni => @uni, :semester => "Fall " + @text[0])
      end

      if @spring_semester
        flash[:notice] = "Semester '#{@spring_semester.semester}' already added."
      else 
        Schedule.create(:uni => @uni, :semester => "Spring " + @text[1])  
      end

    end

 
    
    # # Add fall semester
    # add_semester_to_schedule(@selected_academic_year, 'Fall')

    # # Add spring semester
    # add_semester_to_schedule(@selected_academic_year, 'Spring')

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
      puts "111111111111 Create action params: #{schedule_params}"
      @schedule = Schedule.create!(schedule_params)
      puts "2222 ELLOOOOOO!!!!! " << schedule_params.to_s
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
    # puts "I HERE!!!!!!"

    @uni = (Student.find_by_id(session[:student_id])).uni
    @semester = params[:semester]

    @schedule = Schedule.get_full_schedule().where(uni: @uni).where(semester: @semester)
    

    @schedule.each do |course| 
      @course_to_delete = Schedule.find(course.id)
      @course_to_delete.destroy
    end

    @semester_to_delete = Schedule.get_semesters().where(uni: @uni, semester: @semester)[0]
    # puts "HEREEEE " << @semester_to_delete[0].to_s
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







