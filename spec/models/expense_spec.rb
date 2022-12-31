require 'rails_helper'

RSpec.describe Expense, type: :model do
  it 'should persist a expense' do
    Expense.create!(title: 'Expense test', amount: 100, payer: "gaelle", recipient: "tom")
    expect(Expense.count).to eq(1)
  end
end
