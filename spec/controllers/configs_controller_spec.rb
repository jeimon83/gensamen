# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ConfigsController, type: :controller do
  let!(:admin_user) { FactoryBot.create(:user, :admin) }
  let!(:common_user) { FactoryBot.create(:user) }
  let!(:config) { FactoryBot.create :config }
  
  describe 'GET #index' do
    context 'when user is not admin' do
      it 'returns a success response' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(common_user)
        get :index
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
    context 'format view' do
      it 'responds to json' do
        get :index, format: :json
        expect(response.content_type).to eq 'application/json; charset=utf-8'
      end
    end
  end

  describe 'GET #show' do
    context 'when user is admin' do
      it 'renders the config' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        get :show, params: { id: config.id }
        expect(response.body['config']).to be_present
      end
    end
  end

  describe 'PATCH #update' do
    context 'when user is admin' do
      it 'updates the config' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        patch :update, params: { id: config.id, config: { checklist: 'data' } }
        expect(response.body['config']).to be_present
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when user is admin' do
      it 'destroys the config' do
        allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(admin_user)
        expect { delete :destroy, params: { id: config }}.to change {Config.count}.by(-1)
      end
    end
  end

end
