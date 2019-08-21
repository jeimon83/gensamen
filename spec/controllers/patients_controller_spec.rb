# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  context 'Get patients#index' do
    it 'Returns a success response' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'Responds to JSON' do
      get :index, format: :json
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end
  end
end
