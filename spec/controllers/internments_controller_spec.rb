# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InternmentsController, type: :controller do
  context 'Get internments#index' do
    before(:each) do
      @clinic = FactoryBot.create(:clinic)
      @clinic2 = FactoryBot.create(:clinic)
      @patient = FactoryBot.create(:patient, clinic: @clinic)
    end
    let!(:user1) { FactoryBot.create(:user, clinic_id: nil) }
    let!(:user2) { FactoryBot.create(:user, clinic_id: @clinic2.id) }
    it 'Returns a success response' do
      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user1)
      get :index, params: { patient_id: @patient.id }
      expect(response).to have_http_status(:success)
    end
    it 'Returns a failure response' do
      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user2)
      get :index, params: { patient_id: @patient.id }
      expect(response).to have_http_status(401)
    end
    it 'Responds to JSON' do
      get :index, format: :json, params: { clinic_id: @clinic.id, patient_id: @patient.id }
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end
  end
  context 'Get internments#show' do
    let!(:admin) { FactoryBot.create(:user, clinic_id: nil) }
    let!(:internment) { create :internment }
    it 'Renders the Internment' do
      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin)
      get :show, params: { id: internment.id }
      expect(response.body['internment']).to be_present
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end
  end
end
