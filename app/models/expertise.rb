class Expertise < ApplicationRecord
  belongs_to :user

  validates :domain, presence: true
  validates :years_of_experience, presence: true, length: { minimum: 1 }

end
