require "rails_helper"

RSpec.describe Users::Signup do
  it "sign in user" do
    user = create(:user)
    result = Users::Signin.call(
      {
        email: user.email,
        password: user.password
      }
    )
  end

  it "fails if entered wrong email or password" do
    user = create(:user)
    expect do
      result = Users::Signin.call(
        {
          email: user.email,
          password: "12345678"
        }
      )
    end.to raise_error(ServiceError, "Invalid email or password")
  end


end
