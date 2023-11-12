class Requirement < ActiveRecord::Base
	has_many :coursereq, :foreign_key => "reqID"
	has_many :schedule, :foreign_key => "reqID"
	def self.get_requirements_by_major(major)
		Requirement.where(major_minorID: major)
	end
end