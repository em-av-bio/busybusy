class JourneyDate < ApplicationRecord
  belongs_to :journey

  validates :start_date, presence: true, comparison: { less_than: :end_date }
  validates :end_date, presence: true
end
