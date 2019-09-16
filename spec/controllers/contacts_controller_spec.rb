# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let!(:clinic) { FactoryBot.create(:clinic) }
  let!(:another_clinic) { FactoryBot.create(:clinic) }
  let!(:patient) { FactoryBot.create(:patient, clinic: clinic) }
  let!(:admin_user) { FactoryBot.create(:user, :admin) }
  let!(:common_user) { FactoryBot.create(:user) }
  let!(:contact) { FactoryBot.create :contact }

  describe 'GET #index' do
    context 'when user is admin' do
      it 'returns a success response' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        get :index, params: { patient_id: patient.id }
        expect(response).to have_http_status(:success)
      end
    end
    context 'format view' do
      it 'responds to JSON' do
        get :index, format: :json, params: { clinic_id: clinic.id, patient_id: patient.id }
        expect(response.content_type).to eq 'application/json; charset=utf-8'
      end
    end
  end
  
  describe 'GET #show' do
    context 'when user is admin' do
      it 'Renders the Contact' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        get :show, params: { id: contact.id }
        expect(response.body['contact']).to be_present
      end
    end
  end

  describe 'PATCH #update' do
    context 'when user is admin' do
      it 'updates the contact' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        patch :update, params: { id: contact.id, contact: { phone: '08003339999' } }
        expect(response.body['contact']).to be_present
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when user is admin' do
      it 'destroys the contact' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        expect { delete :destroy, params: { id: contact }}.to change { Contact.count }.by(-1)
      end
    end
  end

end
