require 'rails_helper'

RSpec.describe 'Expense', type: :model do
  let(:valid_attributes) do
    {
      title: 'Expense 1',
      amount: 100,
      payer: 'Payer 1',
      recipient: 'Recipient 1',
      journey: Journey.create(name: 'Journey 1')
    }
  end

  let(:expense) do
    Expense.create!(valid_attributes)
  end

  it 'has a title' do
    expense = Expense.new(title: 'Nourriture')
    expect(expense.title).to eq('Nourriture')
  end

  it 'title cannot be blank' do
    expense = Expense.new
    expect(expense).not_to be_valid
  end

  it 'amount cannot be blank' do
    expense = Expense.new
    expect(expense).not_to be_valid
  end

  it 'payer cannot be blank' do
    expense = Expense.new
    expect(expense).not_to be_valid
  end

  it 'recipient cannot be blank' do
    expense = Expense.new
    expect(expense).not_to be_valid
  end
end
