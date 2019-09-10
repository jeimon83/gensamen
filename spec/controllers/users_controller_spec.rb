# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'Get users#index' do
    let!(:clinic) { FactoryBot.create(:clinic) }
    let!(:user) { FactoryBot.create(:user) }
    it 'Returns a success response' do
      user.clinic_id = nil
      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'Returns a failure response' do
      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(nil)
      get :index
      expect(response).to have_http_status(401)
    end
    it 'Responds to JSON' do
      get :index, format: :json
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end
  end
end
