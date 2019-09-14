# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ConfigsController, type: :controller do
  context 'Get configs#index' do
    let!(:user) { FactoryBot.create(:user) }
    it 'Returns a success response' do
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
  context 'Get configs#show' do
    let!(:config) { create :config }
    let!(:admin) { FactoryBot.create(:user, clinic_id: nil) }
    it 'Renders the Config' do
      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin)
      get :show, params: { id: config.id }
      expect(response.body['config']).to be_present
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end
  end
end
