# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Search::Clinic, type: :service do
  context 'Service' do
    let!(:clinic) { FactoryBot.create(:clinic) }
    let!(:user) { FactoryBot.create(:user, clinic_id: clinic.id) }
    params = {}
    it 'Search all the Clinics' do
      user.clinic_id = nil
      service = Search::Clinic.new(user,params)
      expect(service.fetch_data.count).to eq(Clinic.all.count)
      expect(service.filter_data).to eq(nil)
      expect(service.data).to contain_exactly(*Clinic.all)
    end
    it 'Shows only one Clinic' do
      service = Search::Clinic.new(user,params)
      expect(service.fetch_data.count).to eq(1)
      expect(service.filter_data).to eq(nil)
      expect(service.data).to contain_exactly(*Clinic.where(id: user.clinic_id))
      expect(service.data).to include(clinic)
    end
    it 'Returns nothing' do
      user.clinic_id = Clinic.last.id + 1
      service = Search::Clinic.new(user,params)
      expect(service.fetch_data.count).to eq(0)
      expect(service.fetch_data).not_to include(clinic)
    end
  end
end
