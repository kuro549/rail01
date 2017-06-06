FactoryGirl.define do
  factory :micropost do
    content "I just ate an orange!"
    created_at 10.minutes.ago
    user "f.name"
  end
  
  factory :micropost2, class: Micropost do
  content "Check out the @tauday site by @mhartl: http://tauday.com"
  created_at 3.years.ago
  user "f.name"
  end
  
  30.times do |n|
    factory n, class: Micropost do
      content Faker::Lorem.sentence(5)
      created_at 42.days.ago
      user  "f.name"
    end
  end
end