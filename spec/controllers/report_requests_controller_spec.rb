# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReportRequestsController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:internment) { FactoryBot.create(:internment) }
  let!(:report_request) { FactoryBot.create(:report_request, internment_id: internment.id) }

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
