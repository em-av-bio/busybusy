class JourneyAccommodation < ApplicationRecord
  belongs_to :accommodation
  belongs_to :journey
end
