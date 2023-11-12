class CreateAddRequiredCoursesTrigger < ActiveRecord::Migration
  def change
    create_table :add_required_courses_triggers do |t|
      execute <<-SQL
        CREATE TRIGGER add_required_courses AFTER INSERT ON requirements
        FOR EACH ROW
        BEGIN
          INSERT INTO coursereqs (reqID, courseID)
          SELECT  NEW.reqID, courseID from courses
          where prefixCode || ' ' || courseCode REGEXP NEW.courses;
        end;
      SQL
    end
  end
end
