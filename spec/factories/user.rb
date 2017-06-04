FactoryGirl.define do
  factory :user do
    name "f.name"
    email "factory@example.com"
    password "testes"
    password_confirmation "testes"
  end
  
  factory :ramdom_user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end
end