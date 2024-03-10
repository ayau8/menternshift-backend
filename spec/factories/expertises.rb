FactoryBot.define do
  factory :expertise do
    domain { "Product Design" }
    years_of_experience { 3 }
    association :user
  end
end 
