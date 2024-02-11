require 'faker'

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com"}
    password { "123456" }
    role { "mentor" }
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.last_name }
    last_name { Faker::Name.last_name }
    username { "#{Faker::Name.first_name} #{Faker::Name.last_name}"}
    location { "Tokyo" }
    company { "Menternshift" }
    job_title { "Software Engineer" }
    bio { "Hello, My name is #{Faker::Name.first_name} #{Faker::Name.last_name}" }
    profile_img { "https://media.istockphoto.com/id/1142003972/photo/side-portrait-of-laughing-african-american-man-looking-up.jpg?s=612x612&w=0&k=20&c=fCiBfXI-PIdPACKbH3RdnYxq8ee5MZAhXKQN3I17j1Q=" }
    guidances { ["Interview Coaching", "Skill Development", "Personal Development"] }
    languages { ["English", "Japanese", "Cantonese", "Mandarin"] }
    skills { [] }
    is_available { true }
    timezone { "Japan Standard Time (PST) UTC+09:00" }
    social_platforms {{
      "LinkedIn" => "https://www.linkedin.com/",
      "Behance" => "https://www.behance.net/",
      "Instagram" => "https://www.instagram.com/",
      "Portfolio" => "https://www.wix.com/blog/best-portfolio-websites/"
    }}
  end
end
