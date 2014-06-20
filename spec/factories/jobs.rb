# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    title "MyString"
    expires_at "2014-06-20"
    salary 1
    email "MyString"
  end
end
