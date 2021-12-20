require "rails_helper"

RSpec.describe UserController, type: :request do
  describe 'GET #edit' do
    before(:example) { get update_profile_user_path }
    it "is a success" do
      expect(response).to have_http_status(:found)
    end

    it "assigns user to @user" do
      get update_profile_user_path
      expect(assigns(:user)).to eq(Current.user)
    end
  end
  describe 'PUT #update' do
    it "should update an existing user" do
      user = create(:user)
      user.update(
        name: 'TestName',
        email: 'TestEmail@gmail.com'
      )

      expect(user.name).to eq('TestName')
      expect(user.email).to eq('TestEmail@gmail.com')
    end
  end
end
