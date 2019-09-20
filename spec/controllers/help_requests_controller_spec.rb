# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HelpRequestsController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:clinic) { FactoryBot.create(:clinic) }
  let!(:patient) { FactoryBot.create(:patient) }
  let!(:help_request) { FactoryBot.create(:help_request, clinic_id: clinic.id, patient_id: patient.id) }

  describe 'GET #index' do
    context 'when user is authorized' do
      it 'returns an http success response' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
        get :index, params: { clinic_id: clinic.id }
        expect(response.body['help_request']).to be_present
        expect(response).to have_http_status(:success)
      end
    end
    context 'when authorize api request fails' do
      it 'returns a failure response' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(nil)
        get :index, params: { clinic_id: clinic.id }
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'GET #show' do
    context 'when user is authorized' do
      it 'renders the help report' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
        get :show, params: { id: help_request.id }
        expect(response.body['help_request']).to be_present    
      end
    end
  end

  describe 'PATCH #update' do
    context 'when user is authorized' do
      it 'updates the help request' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
        patch :update, params: { id: help_request.id, help_request: { type: 'Hola' } }
        expect(response.body['help_request']).to be_present
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when user is authorized' do
      it 'destroys the help request' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
        expect { delete :destroy, params: { id: help_request } }.to change { HelpRequest.count }.by(-1)
      end
    end
  end
end
