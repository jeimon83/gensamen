# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClinicsController, type: :controller do
  context 'Search Tests' do
    clinic = FactoryBot.create_list(:clinic, 3)
    let!(:user) { FactoryBot.create(:user, clinic_id: nil) }
    let!(:user1) { FactoryBot.create(:user, clinic_id: clinic) }
    params = {}

    it 'Shows all the Clinics if User.clinic_id.nil' do
      service = Search::Clinic.new(user,params)
      service.run
      service.data
      expect(service.data).to eq(3) 
    end

    it 'Shows only one Clinic if User.clinic_id not nil' do
      service = Search::Clinic.new(user1,params)
      expect(service.data) == clinic
    end
  end
end
