class StudentsController < ApplicationController
	def new
	  @student = Student.new
	end

	def login
	end
      
	def create
	  @student = student.find_by(email: params[:email])
      
	  if @student && @student.authenticate(params[:email][:password])
	    session[:student_id] = @student.id
	    redirect_to login_path
	  else
	    flash[:alert] = "Login failed"
	    redirect_to add_course_path
	  end
	end


end