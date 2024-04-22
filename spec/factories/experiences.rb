FactoryBot.define do
  factory :experience do
    company { "Tech Inc." }
    job_title { "Full-Stack Developer" }
    description { "Developed e-commerce sites for several clients." }
    start_date { Date.new(2023,1,1) }
    end_date { Date.new(2024,1,1) }
    association :user
  end
end
