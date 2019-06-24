50.times do |n|
  name  = "user0#{n+1}"
  email = "user0#{n+1}@email.com"
  password = "111111"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               confirmed_at: Time.zone.now)
end