class LocationAccommodation < ApplicationRecord
  belongs_to :location
  belongs_to :accommodation

  validates :location, presence: true
  validates :accommodation, presence: true
end
