class Journey < ApplicationRecord
  has_many :journey_members, dependent: :destroy
  has_many :users, through: :journey_members, dependent: :destroy
  has_many :journey_locations, dependent: :destroy
  has_many :locations, through: :journey_locations, dependent: :destroy
  validates :name, presence: true
end
