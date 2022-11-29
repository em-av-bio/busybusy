class JourneyAccommodation < ApplicationRecord
  belongs_to :accommodation
  belongs_to :journey

  validates :accommodation, presence: true
  validates :journey, presence: true
end
