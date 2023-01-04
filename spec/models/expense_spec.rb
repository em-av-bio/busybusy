require 'rails_helper'

RSpec.describe Expense, type: :request do
  describe "POST #create" do
    before do
      @journey = FactoryBot.create(:journey)
      @expense = FactoryBot.create(:expense)
    end

    it 'creates a new expense' do
      post '/journeys/:id/expenses', params: { expense: { name: 'test', amount: 10 } }
      expect(response).to have_http_status(:created)
    end
  end
end
