class Journey < ApplicationRecord
  has_many :users, through: :journey_members
  validates :name, presence: true
end
