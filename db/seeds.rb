# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do
  User.create!(
    name: Faker::Name.unique.name,
    uname: Faker::Internet.unique.user_name(5..8),
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(10, 20)
  )
end
users = User.all

standard_user = User.create!(
  name: Faker::Name.unique.name,
  uname: 'standard',
  email: 'standard@test.com',
  password: 'helloworld'
)

50.times do
  Item.create!(
    name: Faker::Hacker.say_something_smart,
    user: users.sample
  )
end

puts 'Seed finished'
puts "#{User.count} users created"
puts "#{Item.count} items created"
