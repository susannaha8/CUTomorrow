class StudentsController < ApplicationController
	def new
	  @student = Student.new
	end

	def index
	end
      
	def create
	  @student = student.find_by(email: params[:email])
      
	  if @student && @student.authenticate(params[:email][:password])
	    session[:student_id] = @student.id
	    redirect_to student_path
	  else
	    flash[:alert] = "Login failed"
	    redirect_to student_path
	  end
	end


end