FactoryBot.define do

  factory :user do
    username { "Joe" }
    email { "joe@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
