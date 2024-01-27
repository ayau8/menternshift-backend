class ProjectArea < ApplicationRecord
  belongs_to :project
  has_many :users
end
