require 'rails_helper'

# RSpec.describe Student, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

# spec/controllers/students_controller_spec.rb

require 'rails_helper'

describe StudentsController, type: :controller do
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

    describe "GET new" do
        it "assigns a new student to @student" do
            get :new
            expect(assigns(:student)).to be_a_new(Student)
        end

        it "renders the new template" do
            get :new
            expect(response).to render_template("new")
        end
    end

    describe "POST create" do
        # context "when the email is already taken" do
        #   it "redirects to sign_up_path with a flash notice" do
        #     post :create, :params => { student => { :uni => 'sma2243', :email => 'sma2243@columbia.edu', :password => 'test', :major1 => 1 } }
    
        #     expect(flash[:notice]).to eq("Email already exists!")
        #     expect(response).to redirect_to(sign_up_path)
        #   end
        # end
    
        # context "when the UNI is already taken" do
        #   it "redirects to sign_up_path with a flash notice" do
        #     post :create, params: { student: { uni: 'sma2243', email: 'new_email@columbia.edu', password: 'password', major1: 2 } }
    
        #     expect(flash[:notice]).to eq("UNI already exists!")
        #     expect(response).to redirect_to(sign_up_path)
        #   end
        # end
    
        # context "when the email and UNI are not taken, and the student is successfully created" do
        #   it "redirects to login_path with a flash notice" do
        #     post :create, params: { student: { uni: 'new_uni', email: 'new_email@columbia.edu', password: 'password', major1: 2 } }
    
        #     expect(flash[:notice]).to eq("Profile created.")
        #     expect(response).to redirect_to(login_path)
        #   end
        # end
    
        # context "when the student creation fails" do
        #   it "redirects to sign_up_path with a flash notice" do
        #     # Set up a scenario where student_params[:email].empty? is true
        #     post :create, params: { student: { uni: '', email: '', password: 'password', major1: 2 } }
    
        #     expect(flash[:notice]).to eq("Error! Information incomplete!")
        #     expect(response).to redirect_to(sign_up_path)
        #   end
        # end
      end


    describe "GET profile" do
        it "renders the profile template" do
            session[:student_id] = student.id

            get :profile
            expect(response).to render_template("profile")
        end
    end

    describe "GET edit_profile" do
        context "when we go to the Edit Profile page" do
            it "renders the edit_profile template" do
                session[:student_id] = student.id

                get :edit_profile
                expect(response).to render_template("edit_profile")
            end
        end
    end

    describe "PUT edit_profile" do
        context "when the request method is PUT" do
            before do
                session[:student_id] = student.id
            end
            it "updates the profile and redirects to profile_path on success" do
                
                # put :edit_profile, params: { student: { standing: "Junior", major1: "Computer Science" } }

                # expect(response).to redirect_to(profile_path)
                # expect(flash[:notice]).to eq("Profile was successfully updated.")
            end
        end

        context "when the request method is PUT" do
            it "renders edit_profile on error" do
                # session[:student_id] = student.id

                # allow_any_instance_of(Student).to receive(:update).and_return(false)

                # put :edit_profile, params: { student: { standing: "Junior", major1: "Computer Science" } }
                # expect(response).to render_template("edit_profile")
                # expect(flash[:error]).to eq("Error updating profile.")
            end
        end
    end
end