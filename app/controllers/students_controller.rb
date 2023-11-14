class StudentsController < ApplicationController
 
	before_action :authorized, only: [:profile, :edit_profile]

	def new
		@student = Student.new
	end


	def create
		@student = Student.new(student_params)
		if @student.save
			redirect_to login_path
		else
			#flash[:notice] = " New Student: #{student_params}"
			#flash[:notice] = " Error Messages: #{@student.errors.messages}"
			redirect_to sign_up_path
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
		params.require(:student).permit(:standing, :major1, :major2, :minor1, :minor2, :minor3)
	  end
end
