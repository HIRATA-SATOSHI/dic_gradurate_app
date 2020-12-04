Staff.create!( email: "admin_admin@jprep.jp",
  password: "adminadmin#1",
  password_confirmation: "adminadmin#1",
  name: "ZDM管理者",
  department: "管理部",
  admin: true)

  150.times do |n|
    name = Faker::JapaneseMedia::DragonBall.character
    email = Faker::Internet.email
    password = "password"
    department = "校舎事務局"
    Staff.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               department: department,
                )
  end

  1200.times do |n|
    name = Faker::JapaneseMedia::Doraemon.character
    course = ["0","1","2","3","4","5"]
    enrollment_status = ["0","1","2"]
    site = ["0","1","2","3","4"]
    school_year = ["0","1","2","3","4","5","6","7"]
    parent_name = Faker::JapaneseMedia::Doraemon.character
    phone_number = Faker::PhoneNumber.phone_number
    email_address = Faker::Internet.email
    live_address =  Faker::Address.full_address
    Student.create!(name: name,
                 course: rand(0..5), 
                 enrollment_status: rand(0..2),
                 site: rand(0..4), 
                 school_year: rand(0..7), 
                 parent_name: parent_name,
                 phone_number: phone_number,
                 email_address: email_address,
                 live_address: live_address)
  end
  
