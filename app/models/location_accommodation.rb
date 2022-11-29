class LocationAccommodation < ApplicationRecord
  belongs_to :location
  belongs_to :accommodation
end
