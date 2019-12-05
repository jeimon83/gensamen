# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InternmentsController, type: :controller do
  let!(:clinic) { FactoryBot.create(:clinic) }
  let!(:other_clinic) { FactoryBot.create(:clinic) }
  let!(:patient) { FactoryBot.create(:patient, clinic: clinic) }
  let!(:admin_user) { FactoryBot.create(:user, :admin) }
  let!(:common_user) { FactoryBot.create(:user, clinic: other_clinic) }
  let!(:internment) { FactoryBot.create(:internment) }

  describe 'GET #index' do
    context 'when user is admin' do
      it 'returns a success response' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        get :index, params: { patient_id: patient.id }
        expect(response).to have_http_status(:success)
      end
    end
    context 'when user is not admin' do
      it 'returns a failure response' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(common_user)
        get :index, params: { patient_id: patient.id }
        expect(response).to have_http_status(401)
      end
    end
    context 'format view' do
      it 'responds to json' do
        get :index, format: :json, params: { clinic_id: clinic.id, patient_id: patient.id }
        expect(response.content_type).to eq 'application/json; charset=utf-8'
      end
    end
  end
  
  describe 'GET #show' do
    context 'when user is admin' do
      it 'renders the internment' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        get :show, params: { id: internment.id }
        expect(response.body['internment']).to be_present
      end
    end
  end

  describe 'PATCH #update' do
    context 'when user is admin' do
      it 'updates the internment' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        patch :update, params: { id: internment.id, internment: { begin_date: '10/05/2020' } }
        expect(response.body['internment']).to be_present
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when user is admin' do
      it 'destroys the internment' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        expect { delete :destroy, params: { id: internment }}.to change {Internment.count}.by(-1)
      end
    end
  end
end
