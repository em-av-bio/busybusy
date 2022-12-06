class JourneyMember < ApplicationRecord
  belongs_to :user
  belongs_to :journey
  enum status: {
    default: 0,
    budget_defined: 1,
    locations_accepted: 2,
    dates_accepted: 3,
    locations_voted: 4,
    dates_voted: 5,
    activities_accepted: 6,
    activities_voted: 7
  }
  # validates :budget, numericality: { only_integer: true }

  def current_status_enum
    read_attribute_before_type_cast(:status)
  end
end
