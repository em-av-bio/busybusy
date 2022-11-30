class JourneyMember < ApplicationRecord
  belongs_to :user
  belongs_to :journey
  # validates :budget, numericality: { only_integer: true }
end
