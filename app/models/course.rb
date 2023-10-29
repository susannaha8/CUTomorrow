class Course < ActiveRecord::Base
	def self.get_courses_by_requirement(reqID)
		Course.joins(:courses_requirements).where(courses_requirements: {reqID: reqID})
	end
end