# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Search::Patient, type: :service do
  context 'Search Service' do
    let!(:clinic1) { FactoryBot.create(:clinic) }
    let!(:clinic2) { FactoryBot.create(:clinic) }
    let!(:clinic3) { FactoryBot.create(:clinic) }
    let!(:admin) { FactoryBot.create(:user, clinic_id: nil) }
    let!(:user1) { FactoryBot.create(:user, clinic_id: clinic1.id) }
    let!(:user3) { FactoryBot.create(:user, clinic_id: clinic3.id) }
    let!(:patient1) { FactoryBot.create(:patient, clinic_id: clinic1.id) }
    let!(:patient2) { FactoryBot.create(:patient, clinic_id: clinic1.id) }
    let!(:patient3) { FactoryBot.create(:patient, clinic_id: clinic2.id) }
    let!(:patient4) { FactoryBot.create(:patient, clinic_id: clinic2.id) }
    
    params = {}

    it 'Shows the Patients of one Clinic' do
      service = Search::Patient.new(user1,params)
      x = Patient.where(clinic_id: user1.clinic_id)
      expect(service.fetch_data.count).to eq(x.count)
      expect(service.filter_data).to eq(nil)
      expect(service.fetch_data).to include(Patient)
    end

    it 'Shows the Patients of all the Clinics' do
      service = Search::Patient.new(admin,params)
      x = Patient.all
      expect(service.fetch_data.count).to eq(x.count)
      expect(service.filter_data).to eq(nil)
      expect(service.data).to contain_exactly(*x)
    end

      it 'Returns nothing' do
      service = Search::Patient.new(user3,params)
      x = Patient.where(clinic_id: user3.clinic_id)
      expect(service.fetch_data.count).to eq(x.count)
      expect(service.filter_data).to eq(nil)
      expect(service.fetch_data).to be_empty
    end
    
  end
end
