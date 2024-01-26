class Project < ApplicationRecord
  belongs_to :user
  has_many :project_areas
  has_many :users, through: :project_areas
end
