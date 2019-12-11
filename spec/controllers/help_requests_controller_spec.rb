# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HelpRequestsController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:internment) { FactoryBot.create(:internment) }
  let!(:help_request) { FactoryBot.create(:help_request, internment_id: internment.id) }

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
