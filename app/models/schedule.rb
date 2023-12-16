class Schedule < ActiveRecord::Base
	belongs_to :course, :foreign_key => "courseID"
	belongs_to :requirement, :foreign_key => "reqID"
	def self.get_full_schedule()
		#Schedule.joins(:course).select("schedules.* ,courses.*")
		#Schedule.includes(:course)
		#Schedule.joins(:course).includes(:requirement).select("schedules.* ,courses.*, requirements.*")
		Schedule.joins(:course, :requirement).select("schedules.* ,courses.*, requirements.*")
		#Schedule.joins("INNER JOIN courses ON schedules.courseID = courses.courseID").select("schedules.*, courses.*")
		#Schedule.joins("INNER JOIN courses ON schedules.courseID = courses.courseID
		#LEFT OUTER JOIN requirements ON schedules.reqID = requirements.reqID;")
		#Schedule.includes(:course, :requirement).where.not(courses: { courseID: nil }).select("schedules.* ,courses.courseTitle as courseTitle, requirements.reqLabel as reqLabel")
		#all = Schedule.joins(:course).select("schedules.semester, schedules.reqID, courses.courseTitle, courses.prefixCode, courses.courseCode").includes(:requirement).select("requirement.*")
		#Schedule.joins(:course).includes(:requirement).select(:semester, :reqID, :courseTitle, :prefixCode, :courseCode, :reqLabel)
		#schedules = Schedule.joins(:course).select(:semester, :reqID, :courseTitle, :prefixCode, :courseCode)
		#schedules.each do |schedule|
			# Fetch requirements separately for each schedule
		#	myreq = Requirement.where(reqID: schedule.reqID).select('reqLabel')
			# Assign fetched requirements to the schedule
		#	if (myreq)
		#		schedule.reqLabel = myreq
		#	else
		#		schedule.reqLabel = nil
			#schedule.reqLabel = myreq.reqLabel if requirements.any?
		#	end
		#end

		#Schedule.includes(:requirement).select("schedules.*, requirement.*")
		#Schedule.find_by_sql("SELECT * from schedules 
		#INNER JOIN courses ON schedules.courseID = courses.courseID
		#LEFT OUTER JOIN requirements ON schedules.reqID = requirements.reqID;")

		#Schedule.joins(:course).includes(:requirement).select("schedules.* ,courses.*, requirements.*")
	end
	def self.get_semesters()
		Schedule.where(course: nil)
	end
end