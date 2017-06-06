FactoryGirl.define do
  factory :user do
    name "f.name"
    email "factory@example.com"
    password "testes"
    password_confirmation "testes"
  end
  
  factory :admin_user, class: User do
    name "adminfac.name"
    email "adminfac@example.com"
    password "testes"
    password_confirmation "testes"
    #admin true
  end
  
  factory :ramdom_user, class: User do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end
end