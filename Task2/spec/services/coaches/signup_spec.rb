require "rails_helper"

RSpec.describe Users::Signup do
  it "sign up coach" do
    result = Coaches::Signup.call(
      {
        name: "Test coach", email: "test@gmail.com", password: "1Q2w3e4!", password_confirmation: "1Q2w3e4!"
      }
    )
    expect(Coach.count).to eq(1)
    expect(result.name).to eq("Test coach")
    expect(result.email).to eq("test@gmail.com")
  end
end
