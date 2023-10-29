class Course < ActiveRecord::Base
	belongs_to :coursereq, :foreign_key => "courseID"
	has_many :schedule, :foreign_key => "courseID"
	def self.get_courses_by_requirement(reqID)
		Course.joins(:coursereq).where(coursereqs: {reqID: reqID})
	end
end