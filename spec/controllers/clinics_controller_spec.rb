# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClinicsController, type: :controller do
  context 'Get clinics#index' do
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
