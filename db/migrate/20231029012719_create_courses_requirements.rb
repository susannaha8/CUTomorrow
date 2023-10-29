class CreateCoursereqs < ActiveRecord::Migration
  def change
    create_table :coursereqs do |t|
      t.integer "reqID"
      t.integer "courseID"
    end
  end
end
