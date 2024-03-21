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

end
