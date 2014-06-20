# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :candidate do
    name "MyString"
    email "MyString"
    expected_salary 1
    status 1
  end
end
