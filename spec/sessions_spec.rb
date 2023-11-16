require 'rails_helper'

describe SessionsController, type: :controller do
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
        # session[:student_id] = student.id
    end

    # describe "GET index" do
    #     it "renders the index template" do
    #         get :index
    #         expect(response).to render_template("index")
    #     end

    # end
    describe 'GET login' do
        context 'When we log in' do
            it 'renders the login template' do
                get :login
                expect(response).to render_template(:login)
            end
        end
    end

    describe 'GET logout' do
        before do
            session[:student_id] = student.id
        end
        context 'When we log in' do
            it 'renders the login template' do
                get :logout
                expect(response).to redirect_to(login_path)
            end
        end
    end

end