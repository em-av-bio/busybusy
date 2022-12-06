class JourneyLocation < ApplicationRecord
  belongs_to :location
  belongs_to :journey
end
