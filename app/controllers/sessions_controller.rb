class SessionsController < ApplicationController
      
	def login
	end

	def create
	  #flash[:notice] = " Email: #{params[:email]}"
	  @student = Student.find_by(email: params[:email])
	  @id = @student.id
	  @password = params[:password]
      
	  if @student && @student.authenticate(@password)
	    session[:student_id] = @student.id
	    redirect_to schedule_path
	  else
	    flash[:notice] = "Login failed"
	    redirect_to login_path
	  end
	end


end