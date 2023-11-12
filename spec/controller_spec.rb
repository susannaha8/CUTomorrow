require 'rails_helper'

describe SchedulesController, type: :controller do

    describe "GET index" do
        it "renders the index template" do
            get :index
            expect(response).to render_template("index")
        end

    end


    describe "GET add_course" do
        it "renders the add_course template" do
            get :add_course, {semester: "Fall 2022"}
            expect(response).to render_template("add_course")
        end
    end

    # describe "POST create" do
    #     it "creates a schedule" do
    #         post :add_course, {schedule: { :uni => "sma2243", :courseID => 1, :semester => "Fall 2022", :reqID => 1}}
    #         expect(response).to render_template("index")
    #     end
    # end

    # describe "POST create_schedule" do

    #     context "when the course is not already added" do
    #         it "creates a new schedule" do
    #             expect {
    #                 post :create, {schedule: { uni: "sma2243", courseID: 1, semester: "Fall 2022", reqID: 1 } }
    #             }.to change(Schedule, :count).by(1)
        
    #             # expect(flash[:notice]).to eq("Schedule #{Schedule.last.schedID} was successfully created.")
    #             # expect(response).to redirect_to(schedule_path)
    #         end
    #     end
      
        # context "when the course is already added" do
        #   before do
        #     Schedule.create!(uni: "sma2243", courseID: 1, semester: "Fall 2022", reqID: 1)
        #   end
      
        #   it "redirects to add_course_path with a flash notice" do
        #     post :create_schedule, params: { schedule: { uni: "sma2243", courseID: 1, semester: "Fall 2022", reqID: 1 } }
      
        #     expect(flash[:notice]).to eq("Course '1' already added.")
        #     expect(response).to redirect_to(add_course_path)
        #   end
        # end
    # end

    describe "DELETE destroy" do
        @course1 = Course.create!({:courseSubtitle => "Calculus III", :courseTitle => "Calculus III", :courseCode => "1201", :prefixID => 2, :departmentCode => "MATH", :prefixCode => "MATH", :schoolCode => "IF"})
        @requirement1 = Requirement.create!({:major_minorID => 1, :divisionCode => "CC", :reqType => "major", :reqLabel => "Math Requirement: Calculus", :courses => "MATH 1201|MATH 1202", :numCourses => 1})
        @coursereq1 = Coursereq.create!({:reqID => 1, :courseID => 1})
        @schedule1 = Schedule.create!({:uni => "sma2243", :courseID => 1, :semester => "Fall 2022", :reqID => 1, :taken => false})
        it "deletes a schedule and redirects to schedule_path with a flash message" do
            # Ensure that the schedule exists in the database
            expect { Schedule.find(1) }.not_to raise_error(ActiveRecord::RecordNotFound)
      
            delete :destroy, { schedID: 1 }
      
            # Ensure that the schedule has been deleted from the database
            expect { Schedule.find(1) }.to raise_error(ActiveRecord::RecordNotFound)
      
            expect(response).to redirect_to(schedule_path)
            expect(flash[:notice]).to match(/Schedule '#{1}' deleted./)
          end

      end
    
end