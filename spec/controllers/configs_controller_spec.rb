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
  end
end
