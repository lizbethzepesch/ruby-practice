FactoryBot.define do
  factory :coach do
    name { 'Test_coach' }
    email { 'Test_coach@example.com'}
    password  { "Test password" }
  end
end
