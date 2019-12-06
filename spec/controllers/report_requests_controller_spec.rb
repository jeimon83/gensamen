# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReportRequestsController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:clinic) { FactoryBot.create(:clinic) }
  let!(:patient) { FactoryBot.create(:patient) }
  let!(:report_request) { FactoryBot.create(:report_request, clinic_id: clinic.id, patient_id: patient.id) }

  describe 'GET #index' do
    context 'when user is authorized' do
      it 'returns an http success response' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
        get :index, params: { clinic_id: clinic.id }
        expect(response.body['report_request']).to be_present
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
      it 'renders the report request' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
        get :show, params: { id: report_request.id }
        expect(response.body['report_request']).to be_present    
      end
    end
  end

  describe 'PATCH #update' do
    context 'when user is authorized' do
      it 'updates the report request' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
        patch :update, params: { id: report_request.id, report_request: { answer: 'Respuesta' } }
        expect(response.body['report_request']).to be_present
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when user is authorized' do
      it 'destroys the report request' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
        expect { delete :destroy, params: { id: report_request } }.to change { ReportRequest.count }.by(-1)
      end
    end
  end
end
