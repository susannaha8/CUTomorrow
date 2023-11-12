class Coursereq < ActiveRecord::Base
	belongs_to :course, :foreign_key => "courseID"
	belongs_to :requirement, :foreign_key => "reqID"
end