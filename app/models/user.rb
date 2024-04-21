class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :experiences
  has_many :expertises, dependent: :destroy
  has_many :projects
  belongs_to :project_area, optional: true

  include PgSearch::Model
  pg_search_scope :search_user,
    against: [ :first_name, :middle_name, :last_name, :username, :location, :company, :job_title, :guidances, :languages, :skills ],
    using: {
      tsearch: { prefix: true }
    }
end
