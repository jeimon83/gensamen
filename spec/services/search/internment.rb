# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Search::Internment, type: :service do
  context 'Search Service' do
    let!(:clinic1) { FactoryBot.create(:clinic) }
    let!(:clinic2) { FactoryBot.create(:clinic) }
    let!(:clinic3) { FactoryBot.create(:clinic) }
    let!(:admin) { FactoryBot.create(:user, clinic_id: nil) }
    let!(:user1) { FactoryBot.create(:user, clinic_id: clinic1.id) }
    let!(:user3) { FactoryBot.create(:user, clinic_id: clinic3.id) }
    let!(:patient1) { FactoryBot.create(:patient, clinic_id: clinic1.id) }
    let!(:patient2) { FactoryBot.create(:patient, clinic_id: clinic2.id) }
    let!(:patient3) { FactoryBot.create(:patient, clinic_id: clinic3.id) }
    let!(:internment1) { FactoryBot.create(:internment, patient_id: patient1.id) }
    let!(:internment2) { FactoryBot.create(:internment, patient_id: patient1.id) }
    let!(:internment3) { FactoryBot.create(:internment, patient_id: patient2.id) }
    let!(:internment4) { FactoryBot.create(:internment, patient_id: patient2.id) }
        
    params = {}

    it 'Shows all the Internments' do
      service = Search::Internment.new(admin,params)
      x = Internment.all
      expect(service.fetch_data.count).to eq(x.count)
      expect(service.filter_data).to eq(nil)
      expect(service.fetch_data).to include(Internment)
    end

    it 'Shows the Internments of a Clinic if present in User' do
      service = Search::Internment.new(user1,params)
      x = Internment.joins(:patient).where(patients: { clinic_id: user1.clinic_id })
      expect(service.fetch_data.count).to eq(x.count)
      expect(service.filter_data).to eq(nil)
      expect(service.fetch_data).to include(Internment)
    end

    it 'Returns nothing' do
      service = Search::Internment.new(user3,params)
      x = Internment.joins(:patient).where(patients: { clinic_id: user3.clinic_id })
      expect(service.fetch_data.count).to eq(x.count)
      expect(service.filter_data).to eq(nil)
      expect(service.fetch_data).to be_empty
    end

  end
end
