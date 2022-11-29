class Location < ApplicationRecord
  validates :country, :city, presence: true
end
