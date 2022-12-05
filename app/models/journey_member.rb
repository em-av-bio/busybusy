class JourneyMember < ApplicationRecord
  belongs_to :user
  belongs_to :journey
  enum status: {
    default: 0,
    budget_defined: 1,
    locations_accepted: 2,
    locations_voted: 3,
    dates_accepted: 4,
    dates_voted: 5,
    activities_accepted: 8,
    activities_voted: 9
  }
  # validates :budget, numericality: { only_integer: true }
end
