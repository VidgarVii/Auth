require_relative '../../../config/environment'

50.times do
  password = ::Faker::Internet.password

  User.create(
      name: ::Faker::Name.first_name,
      email:  ::Faker::Internet.email,
      password: password,
      password_confirmation: password
  )
end
