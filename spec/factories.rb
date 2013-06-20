FactoryGirl.define do
  factory :movie do
    sequence(:title) { |n| "Movie#{n} Title" }
    year '1990'
    association :contributor, factory: :user
  end

  factory :viewing do
    user
    association :viewable, factory: :movie
  end

  factory :user do
    sequence(:email)      { |n| "email#{n}@example.com" }
    password              "password"
    password_confirmation "password"
    factory :admin do
      role                "admin"
    end
  end

  factory :like do
    user
    association :likable, factory: :movie
  end
end
