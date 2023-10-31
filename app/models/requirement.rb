class Requirement < ActiveRecord::Base
	def self.get_requirements_by_major(major)
		Requirement.where(major_minorID: major)
	end
end