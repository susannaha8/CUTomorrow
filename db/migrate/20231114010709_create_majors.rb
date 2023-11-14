class CreateMajors < ActiveRecord::Migration
  def change
    create_table(:majors, primary_key: 'major_minorID') do |t|
      t.string :name, limit: 255
      t.string :mtype, limit: 20  # Major or Minor

      t.timestamps null: false
    end
  end
end
