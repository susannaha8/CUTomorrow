class SessionsController < ApplicationController

	before_action :op_authorized, only: [:login]
      
	def login
        # if current_user_authenticated?  # Assuming you have a helper method to check authentication
        #     redirect_to schedule_path
        # end
	end

	def logout 
		session.delete(:student_id)
        session.delete(:login_time)
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
            session[:login_time] = Time.current
			redirect_to schedule_path
		end
	  end
	end

    private

    def current_user_authenticated?
        return session[:student_id].present? && session[:login_time].present? &&
               (Time.current - session[:login_time]) < 1.day  # Adjust based on your desired timeout
    end

    def op_authorized
        if current_user_authenticated?
            flash[:notice] = "You are already logged in."
            redirect_to schedule_path
        end

        if session[:student_id] && session[:login_time]
            time_elapsed = Time.current - session[:login_time]
            if time_elapsed >= 1.day
                # puts "TIMES UP!!!!"
                flash[:notice] = "Session has expired. Please log in again."
                session.delete(:student_id)
                session.delete(:login_time)
                redirect_to login_path
            end
        end
    end
end