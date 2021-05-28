# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  

5.times do |n|
    User.create!(
      email: "test#{n + 1}@test.com",
      name: "test#{n + 1}",
      password: "test01",
      user_image: File.open('./app/assets/images/test1.jpg')
    )
end

5.times do |n|
    User.create!(
      email: "men#{n + 1}@test.com",
      name: "men#{n + 1}",
      password: "test01",
      user_image: File.open('./app/assets/images/test2.jpg')
    )
end

5.times do |n|
    User.create!(
      email: "women#{n + 1}@test.com",
      name: "women#{n + 1}",
      password: "test01",
      user_image: File.open('./app/assets/images/test3.jpg')
    )
end

5.times do |n|
    User.create!(
      email: "#jin#{n + 1}@test.com",
      name: "#jin#{n + 1}",
      password: "test01",
      user_image: File.open('./app/assets/images/test4.jpg')
    )
end

5.times do |n|
    User.create!(
      email: "beer#{n + 1}@test.com",
      name: "beer#{n + 1}",
      password: "test01",
      user_image: File.open('./app/assets/images/test5.jpg')
    )
end


10.times do |n|
    Liquor.create!(
      user_id: "5",
      name: "beer#{n + 1}",
      introduction: "This beer is the best",
      restaurant_name: "bar",
      liquor_image: open("./app/assets/images/beer.jpg"),
      liquor_genre: "ビール",
      address: "東京都新宿区",
      day: "2021/3/23",
      rate: "5"
    )
  end

