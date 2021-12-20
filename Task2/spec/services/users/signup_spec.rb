require "rails_helper"

RSpec.describe Users::Signup do
  it "sign up user" do
    result = Users::Signup.call(
      {
        name: "KKKKKawfefe", email: "KK@gmail.com", password: "1Q2w3e4!", password_confirmation: "1Q2w3e4!"
      }
    )
    expect(User.count).to eq(1)
    expect(result.name).to eq("KKKKKawfefe")
    expect(result.email).to eq("KK@gmail.com")
  end
end
