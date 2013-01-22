FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@test.com" }
    gender 0
    password "guoyao"
    password_confirmation "guoyao"
  end

  factory :experience do
    company "Test Company"
    title "Test Company Title"
    details "Test Company details"
    user
  end
end