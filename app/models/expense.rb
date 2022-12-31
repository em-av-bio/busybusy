class Expense < ApplicationRecord
  belongs_to :journey, required: false
end
