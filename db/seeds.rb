# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Deleting all data in all databases
Booking.delete_all
puts "Deleting all Bookings"

Style.delete_all
puts "Deleting all Styles"

Teacher.delete_all
puts "Deleting all Teacher Profiles"

User.delete_all
puts "Deleting all Users"


20.times do
# user data
  firstname = Faker::Name.first_name
  lastname =  Faker::Name.last_name
  user = User.create(
    fullname: firstname + " " + lastname,
    email: firstname + "@gmail.com",
    password: 111111
  )
  puts "#{user.fullname} User created"

# teacher profile data
  avail = ["mon: 10am-12pm", "tues: 5pm-8pm", "wed: 9am-11am", "thurs: 7pm-9pm", "fri: 1pm-5pm"]
  teacher = Teacher.create(
    availability: avail.sample,
    price: rand(25..85),
    lesson_length: [30,60].sample,
    bio: Faker::Lorem.paragraph(sentence_count: 3),
    teaching_info: Faker::Lorem.paragraph(sentence_count: 3),
    user_id: user.id
  )
  puts "#{user.fullname} Teacher profile created"
end

# Bookings table data
10.times do |i|
  booking = Booking.create(
    user_id: rand(1..20),
    teacher_id: rand(1..20)
  )
  puts "#{i+1} Booking(s) made"
end

# All available styles
styles = ["Rock", "Metal", "Funk", "Punk", "Indie", "Jazz", "Classical", "Pop", "Bossanova", "Reggae", "Blues", "Bluegrass", "Folk", "Country"]
# Setting just the first style as speciality
spec = [true, false, false]

# Adding in 3 styles per Teacher Profile
20.times do |i|

  3.times do |j|
    Style.create(
      name: styles.sample,
      speciality: spec[j],
      teacher_id: i+1
    )
  end
  puts "Styles created for Teacher Profile with id: #{i+1}"
end
