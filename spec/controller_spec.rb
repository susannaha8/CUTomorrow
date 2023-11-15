require 'rails_helper'

describe SchedulesController, type: :controller do
    let(:student) do
        Student.create!(
          uni: 'sma2243',
          email: 'sma2243@columbia.edu',
          password: 'test',
          major1: 1
        )
    end

    let!(:computer_science_major) do
        Major.create!(
          major_minorID: 1,
          name: 'Computer Science',
          mtype: 'major'
        )
    end

    let!(:intro_to_cs_course) do
        Course.create!(
          courseTitle: 'Intro to CS',
          courseCode: '1004',
          prefixCode: 'COMS'
        )
    end

    # @course1 = Course.create!({:courseSubtitle => "Calculus III", 
    # :courseTitle => "Calculus III", 
    # :courseCode => "1201", 
    # :prefixID => 2, 
    # :departmentCode => "MATH", 
    # :prefixCode => "MATH", 
    # :schoolCode => "IF"})


    before do
    # Manually log in the user by setting the user_id in the session
        session[:student_id] = student.id
    end

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

    describe "POST create_schedule" do
        context "when the course is not already added" do
            it "creates a new schedule and shows a success flash" do
                # post :create, params: { semester: 'Fall 2022', schedule: { uni: 'sma2243', courseID: 1, reqID: 1 } }
                    # expect {
                #     post :create, {schedule: { uni: "sma2243", courseID: 1, semester: "Fall 2022", reqID: 1 } }
                # }.to change(Schedule, :count).by(1)
        
                # expect(flash[:notice]).to eq("Schedule #{Schedule.last.schedID} was successfully created.")
                # expect(response).to redirect_to(schedule_path)
                # post "/add_course/Fall%202022", params: { schedule: { uni: 'sma2243', courseID: 1, reqID: 1 } }

                        # Assuming you have a valid reqID and taken value
                # req_id = 1
                # taken = false

                # # Create a Schedule record directly in the test
                # @schedule1 = Schedule.create!(
                # uni: 'sma2243',
                # courseID: 1,
                # semester: 'Fall 2022',
                # reqID: req_id,
                # taken: taken
                # )

                req_id = 1

                post "/add_course/Fall%202022", params: { schedule: { uni: 'sma2243', courseID: 1, reqID: req_id } }
        

                # Expectations for the created schedule
                expect(Schedule.count).to eq(1)
                expect(Schedule.first.uni).to eq('sma2243')
                expect(Schedule.first.courseID).to eq(1)
                expect(Schedule.first.semester).to eq('Fall 2022')
                expect(Schedule.first.reqID).to eq(1)

                # Expectations for the flash message
                expect(flash[:success]).to eq("Course 'Intro to CS' was successfully added.")

            end
        end
      
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
    end

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
            expect(flash[:notice]).to match(/Course 'Calculus III' deleted./)
          end

      end
    
end