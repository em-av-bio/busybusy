class Journey < ApplicationRecord
  has_many :journey_members, dependent: :destroy
  has_many :users, through: :journey_members, dependent: :destroy
  validates :name, presence: true
end
