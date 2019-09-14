# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  context 'Get patients#index' do
    before(:each) do
      @clinic = FactoryBot.create(:clinic)
      @clinic2 = FactoryBot.create(:clinic)
    end
    let!(:user1) { FactoryBot.create(:user, clinic_id: nil) }
    let!(:user2) { FactoryBot.create(:user, clinic_id: @clinic2.id) }
    it 'Returns a success response' do
      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user1)
      get :index, params: { clinic_id: @clinic.id }
      expect(response).to have_http_status(:success)
    end
    it 'Returns a failure response' do
      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user2)
      get :index, params: { clinic_id: @clinic.id }
      expect(response).to have_http_status(401)
    end
    it 'Responds to JSON' do
      get :index, format: :json, params: { clinic_id: @clinic.id }
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end
  end
  context 'GET patients#show' do
    let!(:clinic1)  { FactoryBot.create(:clinic) }
    let!(:clinic2)  { FactoryBot.create(:clinic) }
    let!(:admin)    { FactoryBot.create(:user, clinic_id: nil) }
    let!(:user)    { FactoryBot.create(:user, clinic_id: clinic1.id) }
    let!(:patient)  { FactoryBot.create(:patient, clinic_id: clinic2.id) }
    it 'Renders the Patient' do
      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin)
      get :show, params: { id: patient.id }
      expect(response.body['patient']).to be_present
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end
    it 'Renders Error: not authorized' do
      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
      get :show, params: { id: patient.id }
      expect(response.body).to match("Not Authorized")
    end
  end
  context 'DELETE patients#destroy' do
    let!(:clinic1)  { FactoryBot.create(:clinic) }
    let!(:clinic2)  { FactoryBot.create(:clinic) }
    let!(:admin)    { FactoryBot.create(:user, clinic_id: nil) }
    let!(:user)    { FactoryBot.create(:user, clinic_id: clinic1.id) }
    let!(:patient)  { FactoryBot.create(:patient, clinic_id: clinic2.id) }
    it 'Destroys the patient' do
      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin)
      expect { delete :destroy, params: { id: patient }}.to change { Patient.count }.by(-1)
    end
    it 'Renders Error: not authorized' do
      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
      delete :destroy, params: { id: patient.id }
      expect(response.body).to match("Not Authorized")
    end
  end
end