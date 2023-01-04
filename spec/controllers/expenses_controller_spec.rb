require 'rails_helper'
begin
  require "expenses_controller"
rescue LoadError
end

if defined?(ExpensesController)
  RSpec.describe ExpensesController, type: :controller do

    before(:each) do
      @user = User.create!(nickname: 'utilisateur', email: 'utilisateur@gmail.com', password: 'password')
      @user2 = User.create!(nickname: 'utilisateur2', email: 'utilisateur2@gmail.com', password: 'password')
      @journey = Journey.create!(name: 'Journey test')
      @journey_member = JourneyMember.create!(user_id: @user.id, journey_id: @journey.id)
      @journey_member2 = JourneyMember.create!(user_id: @user2.id, journey_id: @journey.id)
    end

    let(:valid_attributes) do
      { expense: { journey_id: @journey.id, title: 'test expense', amount: '50', payer: @journey_member.user.nickname, recipient: @journey_member2.user.nickname } }
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new expense" do
          expect {
            post :create, params: valid_attributes
          }.to change(Expense, :count).by(5)
        end
      end
    end

  end
end

#       describe "POST create" do
#         describe "with valid params" do
#           it "creates a new bookmark" do
#             expect {
#               post :create, params: valid_attributes
#             }.to change(Bookmark, :count).by(1)
#           end

#           it "assigns a newly created bookmark as @bookmark" do
#             post :create, params: valid_attributes
#             expect(assigns(:bookmark)).to be_a(Bookmark)
#             expect(assigns(:bookmark)).to be_persisted
#           end

#           it "redirects to the created list" do
#             post :create, params: valid_attributes
#             expect(response).to redirect_to(@list)
#           end
#         end

#         describe "with invalid params" do
#           it "assigns a newly created but unsaved bookmark as @bookmark" do
#             post :create, params: invalid_attributes
#             expect(assigns(:bookmark)).to be_a_new(Bookmark)
#           end

#           it "re-renders the 'new' template or 'lists/show'" do
#             post :create, params: invalid_attributes
#             expect(response).to render_template('new').or redirect_to(@list)
#           end
#         end
#       end

#       describe "DELETE destroy" do
#         it "deletes a bookmark" do
#           @bookmark = Bookmark.create!(valid_attributes[:bookmark].merge(list_id: @list.id))
#           expect {
#             delete :destroy, params: { id: @bookmark.id }
#           }.to change(Bookmark, :count).by(-1)
#         end
#       end
#     end
#   else
#     describe "BookmarksController" do
#       it "should exist" do
#         expect(defined?(Bookmarks)).to eq(true)
#       end
#     end
#   end
#     } }
# end

#     let(:invalid_attributes) do
#       { list_id: @list.id, bookmark: { journey_id: @journey.id, comment: "Good!" } }
#     end

#     describe "GET new" do
#       it "assigns a new bookmark to @bookmark" do
#         get :new, params: valid_attributes
#         expect(assigns(:bookmark)).to be_a_new(Bookmark)
#       end
#     end

#     describe "POST create" do
#       describe "with valid params" do
#         it "creates a new bookmark" do
#           expect {
#             post :create, params: valid_attributes
#           }.to change(Bookmark, :count).by(1)
#         end

#         it "assigns a newly created bookmark as @bookmark" do
#           post :create, params: valid_attributes
#           expect(assigns(:bookmark)).to be_a(Bookmark)
#           expect(assigns(:bookmark)).to be_persisted
#         end

#         it "redirects to the created list" do
#           post :create, params: valid_attributes
#           expect(response).to redirect_to(@list)
#         end
#       end

#       describe "with invalid params" do
#         it "assigns a newly created but unsaved bookmark as @bookmark" do
#           post :create, params: invalid_attributes
#           expect(assigns(:bookmark)).to be_a_new(Bookmark)
#         end

#         it "re-renders the 'new' template or 'lists/show'" do
#           post :create, params: invalid_attributes
#           expect(response).to render_template('new').or redirect_to(@list)
#         end
#       end
#     end

#     describe "DELETE destroy" do
#       it "deletes a bookmark" do
#         @bookmark = Bookmark.create!(valid_attributes[:bookmark].merge(list_id: @list.id))
#         expect {
#           delete :destroy, params: { id: @bookmark.id }
#         }.to change(Bookmark, :count).by(-1)
#       end
#     end
#   end
# else
#   describe "BookmarksController" do
#     it "should exist" do
#       expect(defined?(Bookmarks)).to eq(true)
#     end
#   end
# end
