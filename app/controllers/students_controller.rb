class StudentsController < ApplicationController
 
	
	def new #goes with view for signup page
		@student = Student.new
	end

	def create
		#@student = Student.new(student_params)

	end

	def show #goes with view for profile page

	end

	def edit

	end


	#private
	#def student_params
	#	params.require(:student).permit()
	#end


end

#https://dev.to/kjdowns/creating-a-user-login-system-ruby-on-rails-2kl2 