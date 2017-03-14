User.create!(name: "Lawrence S",
             email: "lsecrease@gmail.com",
             password: "Champ04",
             password_confirmation: "Champ04",
             admin: true)

99.times do |n|
 name = Faker::Name.name
 email = "sample-#{n+1}@test.com"
 password = "password"
 User.create!(name: name,
             email: email,
             password: password,
             password_confirmation: password)

end
