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
    it 'Render JSON' do
      get :show, params: { id: clinic.id }
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end
  end
  context 'Search Service' do
    let!(:user) { FactoryBot.create(:user) }
    params = {}
    it 'Find all the clinics' do
      service = Search::Clinic.new(user,params)
      service.run
      service.data
      expect(response).to have_http_status(:success)
    end
  end
end
