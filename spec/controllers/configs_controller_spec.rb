# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ConfigsController, type: :controller do
  describe 'GET configs#index' do
    user = FactoryBot.create(:user)
    it 'Returns a success response' do
      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'Returns a failure response' do
      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(nil)
      get :index
      expect(response).to have_http_status(401)
    end
  end
end
