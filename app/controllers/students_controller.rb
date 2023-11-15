class StudentsController < ApplicationController
 
	before_action :authorized, only: [:profile, :edit_profile]

	def new
		@student = Student.new
	end


	def create

		if Student.find_by_email(student_params[:email])
			flash[:notice] = "Email already exists!"
			redirect_to sign_up_path
		elsif Student.find_by_uni(student_params[:uni])
			flash[:notice] = "UNI already exists!"
			redirect_to sign_up_path
		else
			@student = Student.new(student_params)
			if !student_params[:email].empty? && @student.save
				flash[:notice] = "Profile created."
				redirect_to login_path
			else
				#flash[:notice] = " New Student: #{student_params}"
				# flash[:notice] = " Error Messages: #{@student.errors.messages}"
				flash[:notice] = "Error! Information incomplete!"
				redirect_to sign_up_path
			end
		end

	end

	def show #goes with view for profile page

	end

	# For profile pages
	def profile
		# id = params[:schedID] # retrieve schedID from URI route
		@student = Student.find(session[:student_id]) # look up schedule by unique ID
		# will render app/views/schedules/show.<extension> by default
	  end
   
	  def edit_profile
		@student = Student.find(session[:student_id])
	  
		if request.put?
		  if @student.update(student_params)
			flash[:notice] = "Profile was successfully updated."
			redirect_to profile_path
		  else
			flash[:error] = "Error updating profile."
			render :edit_profile
		  end
		end
	  end
	  
	  private
	  
	  def student_params
		params.require(:student).permit(:uni, :email, :firstName, :lastName, :standing, :major1, :major2, :minor1, :minor2, :minor3, :password)
	  end
end
