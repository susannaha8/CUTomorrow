class CreateSchedules < ActiveRecord::Migration
  def change
    create_table(:schedules, primary_key: 'schedID') do |t|
      t.string "uni", limit:10
      t.integer "courseID"
      t.integer "reqID"
      t.string "semester", limit:20
      t.boolean "taken"
    end
  end
end

#add autoincrement for schedID, add in foreign keys