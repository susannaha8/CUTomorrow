class CreateCoursereqs < ActiveRecord::Migration
  def change
    create_table(:coursereqs, primary_key: 'coursereqsID')do |t|
      t.integer "reqID"
      t.integer "courseID"
    end
  end
end
