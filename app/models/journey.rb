class Journey < ApplicationRecord
  has_many :journey_members, dependent: :destroy
  has_many :users, through: :journey_members, dependent: :destroy
  has_many :journey_locations, dependent: :destroy
  has_many :locations, through: :journey_locations, dependent: :destroy
  has_many :journey_activities, dependent: :destroy
  has_many :activities, through: :journey_activities
  has_many :expenses
  validates :name, presence: true
end
