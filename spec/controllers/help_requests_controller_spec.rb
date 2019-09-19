# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HelpRequestsController, type: :controller do
  let!(:clinic) { FactoryBot.create(:clinic) }
  let!(:other_clinic) { FactoryBot.create(:clinic) }
  let!(:patient) { FactoryBot.create(:patient) }
  let!(:admin_user) { FactoryBot.create(:user, :admin) }
  let!(:common_user) { FactoryBot.create(:user, clinic_id: other_clinic.id) }
  
  describe 'GET #index' do
    context 'when user is admim' do   
      it 'returns a success response' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        get :index, params: { clinic_id: clinic.id }
        expect(response).to have_http_status(:success)
      end
    end
    context 'when user is from other clinic' do
      it 'returns a failure response' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(common_user)
        get :index, params: { clinic_id: clinic.id }
        expect(response).to have_http_status(401)
      end
    end
    context 'format view' do
      it 'responds to json' do
        get :index, format: :json, params: { clinic_id: clinic.id }
        expect(response.content_type).to eq 'application/json; charset=utf-8'
      end
    end
  end

  describe 'GET #show' do
    context 'when user is admin' do
      it 'renders the help request' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        get :show, params: { id: patient.id }
        expect(response.body['help_request']).to be_present
        expect(response.content_type).to eq 'application/json; charset=utf-8'
      end
    end
    context 'when user is from other clinic' do
      it 'renders error: not authorized' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(common_user)
        get :show, params: { id: report_request.id }
        expect(response.body).to match("Not Authorized")
      end
    end
  end

  describe 'PATCH #update' do
    context 'when user is admin' do
      it 'updates the help request' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        patch :update, params: { id: report_request.id, help_request: { requested_date: '20-03-2020' } }
        expect(response.body['help_request']).to be_present
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when user is admin' do
      it 'destroys the help request' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        expect { delete :destroy, params: { id: help_request }}.to change { HelpRequest.count }.by(-1)
      end
    end
    context 'when user is from other clinic' do
      it 'renders error: not authorized' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(common_user)
        delete :destroy, params: { id: help_request.id }
        expect(response.body).to match("Not Authorized")
      end
    end
  end
end