20.times do 
Student.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  phone_number: Faker::PhoneNumber.phone_number)
end

student_id = 1
20.times do
  Capstone.create!(
    name: Faker::Hipster.word,
    description: Faker::Lorem.paragraph,
    url: Faker::Internet.url,
    screenshot: Faker::Company.logo,
    student_id: student_id+=1
    )
end
