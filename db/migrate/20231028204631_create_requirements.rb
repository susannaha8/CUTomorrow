class CreateRequirements < ActiveRecord::Migration
  def change
    create_table(:requirements, primary_key: 'reqID') do |t|
      t.integer :major_minorID, limit: 4 #added
      t.string  :divisionCode,  limit: 4
      t.string  :reqType,       limit: 6
      t.string  :reqLabel,      limit: 255
      t.text    :reqDesc,       limit: 65535
      t.string  :courses,       limit: 5000
      t.integer :numCourses,    limit: 4
      t.integer :creditLim,     limit: 4
    end
  end
end
