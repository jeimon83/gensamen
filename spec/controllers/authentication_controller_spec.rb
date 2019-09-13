
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  context 'Login with Authenticacion Header' do
    let!(:user) { FactoryBot.create(:user, email: "mymail@email.com", password: "123qwe") }
    it 'Returns Auth Token with User' do
      post :authenticate, params: {"auth": {"email": user.email, "password": user.password }}
      expect(response.body['user']).to be_present
      expect(response.body['auth_token']).to be_present
      expect(response).to have_http_status(:success)
    end
    it 'Returns an invalid credentials error' do
      post :authenticate, params: {"auth": {"email": "myemail@mail.com", "password": "cualquiercosa" }}
      expect(response.body).to match("Error con las credenciales, verifique email y contraseña")
      expect(response).to have_http_status(401)
    end
  end
end