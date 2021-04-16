FactoryBot.define do
  factory :watched do
    association :user
    association :movie
  end
end