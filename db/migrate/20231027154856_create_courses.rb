class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :courseCode
      t.string :courseInfo

      t.timestamps null: false
    end
  end
end
