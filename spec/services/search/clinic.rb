# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClinicsController, type: :controller do
  context 'Get clinics#index' do
    @clinic = FactoryBot.create(:clinic)
    let!(:user) { FactoryBot.create(:user) }
    let!(:user1) { FactoryBot.create(:user, clinic_id: @clinic) }

    @clinic = FactoryBot.create(:clinic)
    params = {}

    it 'Shows all the clinics' do
      service = Search::Clinic.new(user,params)
      service.run
      service.data
      expect(response).to have_http_status(:success)
    end

    it 'search only one clinic' do
      service = Search::Clinic.new(user1,params)
      service.run
      expect(service.data).to eq(@clinic)
      expect(response).to have_http_status(:success)
    end

    it 'Responds to JSON' do
      get :index, format: :json
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end

  end
end
