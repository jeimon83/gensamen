# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InternmentsController, type: :controller do
  context 'Get internments#index' do
    before(:each) do
      @clinic = FactoryBot.create(:clinic)
      @patient = FactoryBot.create(:patient, clinic: @clinic)
    end
    it 'Returns a success response' do
      get :index, params: {clinic_id: @clinic.id, patient_id: @patient.id}
      expect(response).to have_http_status(:success)
    end
  end
end