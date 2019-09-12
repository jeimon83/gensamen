
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  context 'Login with Authenticacion Header' do
    let!(:user) { FactoryBot.create(:user) }
    it 'Returns Auth Token with User' do
      post :authenticate, params: {"auth": {"email": user.email, "password": user.password }}
      expect(response.body['user']).to be_present
      expect(response.body['auth_token']).to be_present
      expect(response).to have_http_status(:success)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body.keys).to match_array(["auth_token", "user"])
    end
  end
end