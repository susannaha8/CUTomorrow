class Coursereq < ActiveRecord::Base
	has_many :course, :foreign_key => "courseID"
end