FactoryGirl.define do
  factory :movie do
    title 'Mary Poppins'
    year '1990'
    association :contributor, factory: :user
  end

  factory :user do
    sequence(:email)      {|n| "email#{n}@example.com" }
    password              "password"
    password_confirmation "password"
  end
end
