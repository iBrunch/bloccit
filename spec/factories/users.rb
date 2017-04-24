FactoryGirl.define do
  factory :user do
    email "user@bloccit.com"
    trait :invalid do
      email ""
    end
  end
end