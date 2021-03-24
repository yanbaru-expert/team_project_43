FactoryBot.define do
  factory :line do
    genre { Faker::Lorem.word }
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
  end
end