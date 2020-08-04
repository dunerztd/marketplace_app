# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Deleting all data in all databases
TeachersStyle.delete_all
puts "Deleting Teachers Styles join table"

Booking.delete_all
puts "Deleting all Bookings"

Style.delete_all
puts "Deleting all Styles"

Teacher.delete_all
puts "Deleting all Teacher Profiles"

User.delete_all
puts "Deleting all Users"

# s3 = Aws::S3::Resource.new(region: 'ap-southeast-2')

20.times do |i|
# user data
  firstname = Faker::Name.first_name
  lastname =  Faker::Name.last_name
  user = User.create(
    fullname: firstname + " " + lastname,
    email: firstname + "@gmail.com",
    password: 111111
  )
  puts "#{user.fullname} User created"

  # Adding images from amazon
  # obj = s3.bucket('marketplace-app-seeds').object("#{i+1}.jpg")

  # obj.get(response_target: "app/assets/images/marketplace_app/#{i}.jpg")

  # item.image.attach(io: File.open("app/assets/images/marketplace_app/#{i}.jpg"), filename: "#{i}.jpg")

# teacher profile data
  avail = ["Mon: 10am-12pm", "Tues: 5pm-8pm", "Wed: 9am-11am", "Thurs: 7pm-9pm", "Fri: 1pm-5pm"]
  teacher = Teacher.create(
    availability: avail.sample,
    price: rand(25..85),
    lesson_length: [30,60].sample,
    bio: Faker::Lorem.paragraph(sentence_count: 20),
    teaching_info: Faker::Lorem.paragraph(sentence_count: 20),
    user_id: user.id
  )
  puts "#{user.fullname} Teacher profile created"
end

# Bookings table data
40.times do |i|
# Creating random combinations between the teacher profiles
    num1 = rand(1..20)
    num2 = rand(1..20)
    if num1 == num2
      num1 - 1
      if num1 == 0
        num2 = rand(2..20)
      end
    end

  booking = Booking.create(
    user_id: num1,
    teacher_id: num2
  )
  puts "#{i+1} Booking(s) made"
end

# All available styles
styles = ["Rock", "Metal", "Funk", "Punk", "Indie", "Jazz", "Classical", "Pop", "Bossanova", "Reggae", "Blues", "Bluegrass", "Folk", "Country"]

# Creating all styles for the Style Table
styles.each do |style|
  style = Style.create(
    name: style
  )
  puts "#{style.name} style created"
end


# Adding in 3 styles per Teacher Profile
20.times do |i|

  teacher = Teacher.find(i+1)
  3.times do |j|
    num = rand(1..14)
    temp_style = Style.find(num)
    teacher.styles << temp_style

    # Setting one style as speciality as default is false
    teacher.teachers_styles.first.update(speciality: true)

  end
  puts "Styles created for Teacher Profile with id: #{i+1}"
end
