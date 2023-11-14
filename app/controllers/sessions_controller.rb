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
	  
      
	  if !@student
		flash[:notice] = "invalid email"
		redirect_to login_path
	  else
		@auth = @student.authenticate(params[:password])
		if !@auth
			flash[:notice] = "incorrect password"
			redirect_to login_path
		else
			session[:student_id] = @student.id
			redirect_to schedule_path
		end
	  end
	end


end