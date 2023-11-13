class SessionsController < ApplicationController
      
	def login
	end

	def logout 
		session.delete(:student_id)
		redirect_to login_path
	end

	def create
	  #flash[:notice] = " Email: #{params[:email]}"
	  @student = Student.find_by(email: params[:email])
      
	  if @student && @student.authenticate(params[:password])
	    session[:student_id] = @student.id
	    redirect_to schedule_path
	  else
	    flash[:notice] = "Login failed"
	    redirect_to login_path
	  end
	end


end