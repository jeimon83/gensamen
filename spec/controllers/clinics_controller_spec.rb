# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClinicsController, type: :controller do
  let!(:clinic) { FactoryBot.create(:clinic) }
  let!(:other_clinic) { FactoryBot.create(:clinic) }
  let!(:admin_user) { FactoryBot.create(:user, :admin) }
  let!(:common_user) { FactoryBot.create(:user, clinic_id: clinic.id) }
  let!(:other_user) { FactoryBot.create(:user, clinic_id: other_clinic.id) }

  describe 'GET #index' do
    context 'when user is not admin' do
      it 'returns an http success response' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(common_user)
        get :index
        expect(response.body['clinic']).to be_present
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
    context 'when user is admin' do
      it 'renders the clinic' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        get :show, params: { id: clinic.id }
        expect(response.body['clinic']).to be_present
        hash_body = JSON.parse(response.body)
        expect(hash_body.keys).to match_array('clinic')
        expect(hash_body).to match(
          'clinic' => {
            'beds_judicial' => clinic.beds_judicial,
            'beds_voluntary' => clinic.beds_voluntary,
            'cuit' => clinic.cuit,
            'habilitation' => clinic.habilitation,
            'id' => clinic.id,
            'name' => clinic.name
          }
        )
      end
    end
    context 'when user is from other clinic' do
      it 'renders error: not authorized' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(other_user)
        get :show, params: { id: clinic.id }
        expect(response.body).to match('Not Authorized')
      end
    end
    context 'when user is from the same clinic' do
      it 'renders the clinic' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(common_user)
        get :show, params: { id: clinic }
        expect(response.body['clinic']).to be_present
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'PATCH #update' do
    context 'when user is admin' do
      it 'updates the clinic' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        patch :update, params: { id: clinic.id, clinic: { name: 'Sanatorio' } }
        expect(response.body['clinic']).to be_present
        expect(response).to have_http_status(:success)
      end
    end
    context 'when user is from other clinic' do
      it 'renders error: not authorized' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(other_user)
        patch :update, params: { id: clinic, clinic: { name: 'Sanatorio' } }
        expect(response.body).to match('Not Authorized')
      end
    end
    context 'when user is from the same clinic' do
      it 'updates the clinic' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(common_user)
        patch :update, params: { id: clinic.id, clinic: { name: 'Sanatorio' } }
        expect(response.body['clinic']).to be_present
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when user is admin' do
      it 'destroys the clinic' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        expect { delete :destroy, params: { id: clinic } }.to change { Clinic.count }.by(-1)
      end
    end
    context 'when user is from other clinic' do
      it 'renders error: not authorized' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(other_user)
        delete :destroy, params: { id: clinic }
        expect(response.body).to match('Not Authorized')
      end
    end
    context 'when user is from the same clinic' do
      it 'destroys the clinic' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(common_user)
        expect { delete :destroy, params: { id: clinic } }.to change { Clinic.count }.by(-1)
      end
    end
  end

  describe 'GET #contacts' do
    context 'when user is admin' do
      it 'renders the contacts of the clinic' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        get :contacts, params: { id: clinic }
        expect(response.body['contact']).to be_present
      end
    end
  end

  describe 'GET #internments' do
    context 'when user is admin' do
      it 'renders the internments of the clinic' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        get :internments, params: { id: clinic.id }
        expect(response.body['internment']).to be_present
      end
    end
  end
end
