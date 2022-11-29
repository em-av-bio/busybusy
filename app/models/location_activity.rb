class LocationActivity < ApplicationRecord
  belongs_to :location
  belongs_to :activity

  validates :location, presence: true
  validates :activity, presence: true
end
