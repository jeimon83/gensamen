# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:comment) { FactoryBot.create(:comment, user: user) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'responds to json' do
       get :index, format: :json
       expect(response.content_type).to eq 'application/json; charset=utf-8'
    end
  end

  describe "GET #show" do
    it "renders the comment" do
      get :show, params: { id: comment.id }
      expect(response.body['comment']).to be_present
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end
  end

  describe "PATCH #update" do
    it "updates the comment" do
      patch :update, params: { id: comment.id, comment: { body: 'Texto' } }
      expect(response.body['comment']).to be_present
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the comment" do
      expect { delete :destroy, params: { id: comment }}.to change { Comment.count }.by(-1)
    end
  end

end
