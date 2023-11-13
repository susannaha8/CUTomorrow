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