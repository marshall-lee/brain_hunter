
FactoryGirl.define do
  factory :candidate do
    sequence(:name) { |n| "Jerk number #{n}" }
    email "someone@gmail.com"
    expected_salary 60000
    status :searching
  end
end
