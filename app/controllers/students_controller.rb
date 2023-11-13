class StudentsController < ApplicationController
 
	
	def new #goes with view for signup page
		@student = Student.new
	end

	def create
		#@student = Student.new(student_params)

	end

	def show #goes with view for profile page

	end

	# For profile pages
	def profile
		# id = params[:schedID] # retrieve schedID from URI route
		@student = Student.find(3) # look up schedule by unique ID
		# will render app/views/schedules/show.<extension> by default
	  end
   
	  def edit_profile
		@student = Student.find(3)
	  
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
