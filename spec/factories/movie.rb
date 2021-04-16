FactoryBot.define do
  factory :movie do
    genre { Faker::Lorem.word }
    title { Faker::Lorem.sentence }
    url { Faker::Internet.url }
  end
end