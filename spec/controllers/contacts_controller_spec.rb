# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  context 'Get contacts#index' do
    before(:each) do
      @clinic = FactoryBot.create(:clinic)
      @patient = FactoryBot.create(:patient, clinic: @clinic)
    end
    user = FactoryBot.create(:user)
    it 'Returns a success response' do
      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
      get :index, params: { clinic_id: @clinic.id, patient_id: @patient.id }
      expect(response).to have_http_status(:success)
    end
    it 'Responds to JSON' do
      get :index, format: :json, params: { clinic_id: @clinic.id, patient_id: @patient.id }
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end
  end
  context 'Get contacts#show' do
    let!(:contact) { create :contact }
    it 'Render JSON' do
      get :show, params: { id: contact.id }
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end
  end
end
