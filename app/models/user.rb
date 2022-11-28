class User < ApplicationRecord
  has_many :journeys, through: :journey_members
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
end
