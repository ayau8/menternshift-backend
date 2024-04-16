FactoryBot.define do
  factory :project do
    name { "Example Project" }
    description { "This is an example project." }
    image_url { "https://static4.depositphotos.com/1013501/430/i/450/depositphotos_4308060-stock-photo-project.jpg" }
    start_date { Date.new(2023,1,1) }
    end_date { Date.new(2024,1,1) }
    duration { 1 }
    progress { "Completed" }
    skills { [] }
    association :user
  end
end
