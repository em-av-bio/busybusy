class User < ApplicationRecord
  has_many :journeys, through: :journey_members
  has_one_attached :photo
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, uniqueness: true
end
