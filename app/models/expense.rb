class Expense < ApplicationRecord
  belongs_to :journey, required: false
  validates :title, presence: true
  validates :amount, presence: true
  validates :payer, presence: true
  validates :recipient, presence: true
end
