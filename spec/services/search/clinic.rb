# frozen_string_literal: true

require 'rails_helper'

#RSpec.describe ClinicsController, type: :controller do
RSpec.describe Search::Clinic do
  context 'Search' do
    let!(:clinic) { FactoryBot.create(:clinic) }
    let!(:user) { FactoryBot.create(:user) }
    params = {}
    it 'Search all the Clinics' do
      user.clinic_id = nil
      service = Search::Clinic.new(user,params)
      expect(service.fetch_data.count).to eq(Clinic.all.count)
      expect(service.filter_data).to eq(nil)
    end
    it 'Shows only one Clinic' do
      user.clinic_id = clinic.id
      service = Search::Clinic.new(user,params)
      expect(service.fetch_data.count).to eq(1)
      expect(service.filter_data).to eq(nil)
    end
  end
end
