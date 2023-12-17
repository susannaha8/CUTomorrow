class StudentsController < ApplicationController
 
	before_action :authorized, only: [:profile, :edit_profile]

	def new
        @major_minor_options = Major.all
        @school = [
			{ id: 1, name: 'Barnard College' },
			{ id: 2, name: 'Columbia College' },
			{ id: 3, name: 'SEAS' },
            { id: 4, name: 'GS' }
		]
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
		# @major1 = Major.find(@student.major1).name
		# @major1 = @student.major1 ? Major.find(@student.major1).name : ""
		if @student.major1.present?
			@major1 = Major.find(@student.major1).name
		# else
		# 	@major1 = "" 
		end
		if @student.major2.present?
			@major2 = Major.find(@student.major2).name
		else
			@major2 = ""  
		end
		if @student.minor1.present?
			@minor1 = Major.find(@student.minor1).name
		else
			@minor1 = ""  
		end
		if @student.minor2.present?
			@minor2 = Major.find(@student.minor2).name
		else
			@minor2 = ""  
		end
		if @student.minor3.present?
			@minor3 = Major.find(@student.minor3).name
		else
			@minor3 = ""  
		end
		
	end
   
	def edit_profile
		@student = Student.find(session[:student_id])
		@categories = [
			{ id: 1, name: 'Fall 2021' },
			{ id: 2, name: 'Spring 2022' },
			{ id: 3, name: 'Summer 2022' },
			{ id: 4, name: 'Fall 2022' },
			{ id: 5, name: 'Spring 2023' },
			{ id: 6, name: 'Summer 2023' },
			{ id: 7, name: 'Fall 2023' },
			{ id: 8, name: 'Spring 2024' },
			{ id: 9, name: 'Summer 2024' },
			{ id: 10, name: 'Fall 2024' },
			{ id: 11, name: 'Spring 2025' },
			{ id: 12, name: 'Summer 2025' },
			{ id: 13, name: 'Fall 2025' },
			{ id: 14, name: 'Spring 2026' },
			{ id: 15, name: 'Summer 2026' },
		]
		@season = [
			{ id: 1, name: 'Fall' },
			{ id: 2, name: 'Spring' },
			{ id: 3, name: 'Summer' }
		]
		@year = [
			{ id: 1, name: '2017' },
			{ id: 2, name: '2018' },
			{ id: 3, name: '2019' },
			{ id: 4, name: '2020' },
			{ id: 5, name: '2021' },
			{ id: 6, name: '2022' },
			{ id: 7, name: '2023' },
			{ id: 8, name: '2024' },
			{ id: 9, name: '2025' },
			{ id: 10, name: '2026' },
			{ id: 11, name: '2027' },
			{ id: 12, name: '2028' }
		]
		@major_minor_options = Major.all
		if request.put?
		  if @student.update(student_params)
			flash[:notice] = "Profile was successfully updated."
			puts @student.standing
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