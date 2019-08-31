# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ConfigsController, type: :controller do
  describe 'GET configs#index' do
    it 'Returns a success response' do
      user = FactoryBot.create(:user)
      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(user)
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
