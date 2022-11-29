class JourneyActivity < ApplicationRecord
  belongs_to :journey
  belongs_to :activity

  validates :journey, presence: true
  validates :activity, presence: true
end
