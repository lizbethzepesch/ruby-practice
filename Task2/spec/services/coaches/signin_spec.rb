require "rails_helper"

RSpec.describe Coaches::Signup do
  it "sign in user" do
    coach = create(:coach)
    Coaches::Signin.call(
      {
        email: coach.email,
        password: coach.password
      }
    )
  end

  it "fails if entered wrong email or password" do
    coach = create(:coach)
    expect do
      Coaches::Signin.call(
        {
          email: coach.email,
          password: "12345678"
        }
      )
    end.to raise_error(ServiceError, "Invalid email or password")
  end


end
