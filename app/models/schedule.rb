class Schedule < ActiveRecord::Base
	belongs_to :course, :foreign_key => "courseID"
end