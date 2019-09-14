# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClinicsController, type: :controller do
  context 'Get clinics#index' do
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
  context 'Get clinics#show' do
    let!(:clinic) { create :clinic }
    let!(:admin) { FactoryBot.create(:user, clinic_id: nil) }
    it 'Renders the Clinic' do
      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin)
      get :show, params: { id: clinic.id }
      expect(response.body['clinic']).to be_present
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end
  end
end
