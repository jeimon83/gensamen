# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InternmentsController, type: :controller do
  context 'Get internments#index' do
    before(:each) do
      @clinic = FactoryBot.build(:clinic)
      @patient = FactoryBot.build(:patient)
    end
    it 'Returns a success response' do
      get :index, params: {clinic_id: @clinic.id, patient_id: @patient.id}
      expect(response).to have_http_status(:success)
    end
    #it 'Responds to JSON' do
    #  get :index, format: :json
    #  expect(response.content_type).to eq 'application/json; charset=utf-8'
    #end
  end
end
