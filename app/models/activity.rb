class Activity < ApplicationRecord
  has_many :journey_activities
  has_many :journey, through: :journey_activities
  belongs_to :location

  validates :name, presence: true
  validates :duration_in_h, presence: true
  validates :details, presence: true
end
