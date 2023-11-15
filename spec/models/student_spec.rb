# require 'rails_helper'

# # RSpec.describe Student, type: :model do
# #   pending "add some examples to (or delete) #{__FILE__}"
# # end

# # spec/controllers/students_controller_spec.rb

# require 'rails_helper'

# RSpec.describe StudentsController, type: :controller do
#   describe "GET profile" do
#     it "renders the profile template" do
#       student = create(:student) # Assuming you have FactoryBot or similar for creating test data
#       session[:student_id] = student.id

#       get :profile
#       expect(response).to render_template("profile")
#     end
#   end

#   describe "GET edit_profile" do
#     it "renders the edit_profile template" do
#       student = create(:student) # Assuming you have FactoryBot or similar for creating test data
#       session[:student_id] = student.id

#       get :edit_profile
#       expect(response).to render_template("edit_profile")
#     end

#     context "when the request method is PUT" do
#       it "updates the profile and redirects to profile_path on success" do
#         student = create(:student)
#         session[:student_id] = student.id

#         put :edit_profile, params: { student: { standing: "Junior", major1: "Computer Science" } }
#         expect(response).to redirect_to(profile_path)
#         expect(flash[:notice]).to eq("Profile was successfully updated.")
#       end

#       it "renders edit_profile on error" do
#         student = create(:student)
#         session[:student_id] = student.id

#         allow_any_instance_of(Student).to receive(:update).and_return(false)

#         put :edit_profile, params: { student: { standing: "Junior", major1: "Computer Science" } }
#         expect(response).to render_template("edit_profile")
#         expect(flash[:error]).to eq("Error updating profile.")
#       end
#     end
#   end
# end