class SessionsController < ApplicationController
      
	def login
	end

	def create
	  flash[:notice] = (params[:email]).to_s
	  @student = Student.find_by(email: params[:email])
      
	  if @student && @student.authenticate(params[:email][:password])
	    session[:student_id] = @student.id
	    redirect_to schedule_path
	  else
	    #flash[:notice] = "Login failed"
	    redirect_to login_path
	  end
	end


end