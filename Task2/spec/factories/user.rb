FactoryBot.define do
  factory :user do
    name { 'Test_user' }
    email { 'Test_user@example.com'}
    password  { "Test password" }
  end
end
