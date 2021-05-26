FactoryBot.define do
  factory :liquor do
    name { Faker::Lorem.characters(number: 5) }
    intriduction { Faker::Lorem.characters(number: 20) }
    image {}
    day {2021/05/21}
    rate { 4 }
    address {東京都千代田区２丁目}
    restaurant_name {Faker::Lorem.characters(number: 5)}
    genre_id {1}
    user
  end
end