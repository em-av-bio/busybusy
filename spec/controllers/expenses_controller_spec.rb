require 'rails_helper'
require 'rails-controller-testing'
Rails::Controller::Testing.install

begin
  require 'expenses_controller'
rescue LoadError
end

if defined?(ExpensesController)
  RSpec.describe ExpensesController, type: :controller do
    before(:each) do
      @user = User.create!(nickname: 'user', email: 'user@gmail.com', password: 'password')
      @user2 = User.create!(nickname: 'user2', email: 'user2@gmail.com', password: 'password')
      @user3 = User.create!(nickname: 'user3', email: 'user3@gmail.com', password: 'password')
      @journey = Journey.create!(name: 'Journey test')
      @journey_members = []
      @journey_member = JourneyMember.create!(user: @user, journey: @journey)
      @journey_members << @journey_member
      @journey_member1 = JourneyMember.create!(user: @user2, journey: @journey)
      @journey_members << @journey_member1
      @journey_member2 = JourneyMember.create!(user: @user3, journey: @journey)
      @journey_members << @journey_member2
      sign_in @user
    end

    let!(:valid_attributes) do
      { journey_id: @journey.id, expense: { title: "expense's test", amount: '60', payer: @user.nickname, recipient: [@user.nickname, @user2.nickname, @user3.nickname] } }
    end

    let!(:other_attributes) do
      { journey_id: @journey.id, expense: { title: "expense's test", amount: '60', payer: @user.nickname, recipient: [@user2.nickname, @user3.nickname] } }
    end

    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new expense' do
          expect { post :create, params: valid_attributes }.to change(Expense, :count).by(1)
        end

        it 'assigns a newly created expense as @expense' do
          post :create, params: valid_attributes
          expect(assigns(:expense)).to be_a(Expense)
          expect(assigns(:expense)).to be_persisted
        end

        it 'redirects to the created expense' do
          post :create, params: valid_attributes
          expect(response).to redirect_to(journey_expenses_path(@journey))
        end

        it "update journey's members solde if payer's expense is also a recipient" do
          post :create, params: valid_attributes
          @journey_member.reload
          @journey_member1.reload
          @journey_member2.reload
          expect(@journey_member.solde).to eq(60 - 60 / 3)
        end

        it "update journey's members solde if payer's expense isn't also a recipient" do
          post :create, params: other_attributes
          @journey_member.reload
          @journey_member1.reload
          @journey_member2.reload
          expect(@journey_member.solde).to eq(60)
        end
      end
    end

    describe 'GET balance' do
      it "get balance's page" do
        get :balance, params: { journey_id: @journey.id }
        expect(response.status).to eq(200)
      end
    end
  end
end
