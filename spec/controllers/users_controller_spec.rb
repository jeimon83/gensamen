# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    context 'Get users#index' do
      let!(:user) { FactoryBot.create(:user, :admin) }
      it 'returns a success response' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
        get :index
        expect(response).to have_http_status(:success)
      end
      it 'returns a failure response' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(nil)
        get :index
        expect(response).to have_http_status(401)
      end
      it 'responds to JSON' do
        get :index, format: :json
        expect(response.content_type).to eq 'application/json; charset=utf-8'
      end
    end
  end
end
