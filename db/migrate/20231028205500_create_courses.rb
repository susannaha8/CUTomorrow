class CreateCourses < ActiveRecord::Migration
  def change
    create_table(:courses, primary_key: 'courseID') do |t|
      t.string  "courseSubtitle", limit: 256
      t.string  "courseTitle",    limit: 256
      t.string  "courseCode",     limit: 4
      t.string  "typeName",       limit: 64
      t.integer "prefixID",       limit: 4
      t.string  "departmentCode", limit: 4
      t.string  "schoolCode",     limit: 4
      t.string  "divisionCode",   limit: 4
      t.string  "prefixCode",     limit: 4
    end
  end
end