class Schedule < ActiveRecord::Base
	belongs_to :course, :foreign_key => "courseID"
	belongs_to :requirement, :foreign_key => "reqID"
	def self.get_full_schedule()
		Schedule.joins(:course, :requirement).select("schedules.* , courses.*, requirements.*")
	end
end