class Mentorship < ApplicationRecord
  belongs_to :mentee
  belongs_to :mentor
  belongs_to :project
end
