# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReportDefinitionsController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:report_definition) { FactoryBot.create(:report_definition) }

  describe 'GET #index' do
    context 'when user is authorized' do
      it 'returns an http success response' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
        get :index
        expect(response.body['report_definition']).to be_present
        expect(response).to have_http_status(:success)
      end
    end
    context 'when authorize api request fails' do
      it 'returns a failure response' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(nil)
        get :index
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'GET #show' do
    context 'when user is authorized' do
      it 'renders the report definition' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
        get :show, params: { id: report_definition.id }
        expect(response.body['report_definition']).to be_present    
      end
    end
  end

  describe 'PATCH #update' do
    context 'when user is authorized' do
      it 'updates the clinic' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
        patch :update, params: { id: report_definition.id, report_definition: { name: 'Reporte' } }
        expect(response.body['report_definition']).to be_present
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when user is authorized' do
      it 'destroys the report_definition' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
        expect { delete :destroy, params: { id: report_definition } }.to change { ReportDefinition.count }.by(-1)
      end
    end
  end
end
