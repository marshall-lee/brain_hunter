
FactoryGirl.define do
  factory :job do
    sequence(:title) { |n| "Sample job ##{n}" }
    expires_at { Time.now + 5.days }
    salary 10000
    email "hr@example.com"
  end
end
