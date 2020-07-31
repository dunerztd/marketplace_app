# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

- database delete all
- prints out if something was created

20.times do

  firstname = Faker::Name.first_name
  lastname =  Faker::Name.last_name
  user = User.create(
    fullname: firstname + lastname,
    email: firstname + "@gmail.com",
    password: 111111
  )
  puts "#{user.fullname} created"


Teachers
availability
price
lesson_length
bio
teaching_info
user_id

Bookings
user_id
teacher_id

Styles
name
speciality (boolean true or false)
teacher_id