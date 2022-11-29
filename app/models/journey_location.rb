class JourneyLocation < ApplicationRecord
  belongs_to :location
  belongs_to :journey

  validates :location, presence: true
  validates :journey, presence: true
end
