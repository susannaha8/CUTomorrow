class Requirement < ActiveRecord::Base
	has_many :coursereq, :foreign_key => "reqID"
	has_many :schedule, :foreign_key => "reqID"
	def self.get_requirements_by_major(major)
		Requirement.where(major_minorID: major)
	end

	def self.get_requirement_labels_by_major(major)
		# return an array of the major's requirement labels (ie Calc Req, Physics Req, etc.)
		(Requirement.where(major_minorID: major)).pluck(:reqLabel)
	end
end