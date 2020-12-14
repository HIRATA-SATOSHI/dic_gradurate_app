Staff.create!( email: "admin_admin@jprep.jp",
  password: "adminadmin#1",
  password_confirmation: "adminadmin#1",
  name: "ZDM管理者",
  department: 5,
  admin: true)

  Staff.create!( email: "staff@jprep.jp",
  password: "staffstaff#1",
  password_confirmation: "staffstaff#1",
  name: "スタッフ1",
  department: 2,
  admin: false)

  60.times do |n|
    name = Faker::JapaneseMedia::DragonBall.character
    email = Faker::Internet.email
    password = "password"
    department = 0
    Staff.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               department: department,
                )
  end

  30.times do |n|
    name = Faker::JapaneseMedia::StudioGhibli.character
    email = Faker::Internet.email
    password = "password"
    department = 1
    Staff.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               department: department,
                )
  end

  20.times do |n|
    name = Faker::JapaneseMedia::OnePiece.character
    email = Faker::Internet.email
    password = "password"
    department = 2
    Staff.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               department: department,
                )
  end

  15.times do |n|
    name = Faker::JapaneseMedia::Conan.character
    email = Faker::Internet.email
    password = "password"
    department = 3
    Staff.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               department: department,
                )
  end

  15.times do |n|
    name = Faker::Movies::BackToTheFuture.character
    email = Faker::Internet.email
    password = "password"
    department = 4
    Staff.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               department: department,
                )
  end

  15.times do |n|
    name = Faker::Movies::StarWars.character
    email = Faker::Internet.email
    password = "password"
    department = 5
    Staff.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               department: department,
                )
  end

  1200.times do |n|
    number =  n + 10001
    puts  "nubmber= #{number}"
    name = Faker::JapaneseMedia::Doraemon.character
    course = ["0","1","2","3","4","5"]
    enrollment_status = ["0","1","2"]
    site = ["0","1","2","3","4"]
    school_year = ["0","1","2","3","4","5","6","7"]
    parent_name = Faker::JapaneseMedia::Doraemon.character
    phone_number = "031234456#{n}"
    email_address = Faker::Internet.email
    live_address =  Faker::Address.full_address
    Student.create!(number: number,
                 name: name,
                 course: rand(0..5), 
                 enrollment_status: rand(0..2),
                 site: rand(0..4), 
                 school_year: rand(0..7), 
                 parent_name: parent_name,
                 phone_number: phone_number,
                 email_address: email_address,
                 live_address: live_address)
  end
  
