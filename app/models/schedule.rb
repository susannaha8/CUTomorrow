class Schedule < ActiveRecord::Base
	belongs_to :course, :foreign_key => "courseID"
	belongs_to :requirement, :foreign_key => "reqID"
	def self.get_full_schedule()
		Schedule.joins(:course, :requirement).select("schedules.* ,courses.*, requirements.*")
		#Schedule.joins(:course, :requirement).select("schedules.* ,courses.*, requirements.*")
		#joins("LEFT OUTER JOIN action_users ON (action_users.id = actions.id)")
	end
	def self.get_semesters()
		Schedule.where(course: nil)
	end
end