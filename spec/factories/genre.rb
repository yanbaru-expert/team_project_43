FactoryBot.define do
  factory :genre do
    title { Faker::Lorem.word }
    parameter { Faker::Lorem.word }
    color { Faker::Lorem.word }
  end
end 