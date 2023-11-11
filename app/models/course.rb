class Course < ActiveRecord::Base
	has_many :coursereq, :foreign_key => "courseID"
	has_many :schedule, :foreign_key => "courseID"
	def self.get_courses_by_requirement(reqID)
		Course.joins(:coursereq).where(coursereqs: {reqID: reqID})
	end

	#maybe
	#def self.check_if_course_fulfills_req(courseID, reqID)

	#end
end