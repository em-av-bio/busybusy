class Activity < ApplicationRecord
  has_many :journey, through: :weekend_activities
  has_many :location, through: :location_activities

  validates :name, presence: true
  validates :duration_in_h, presence: true
  validates :details, presence: true
end
