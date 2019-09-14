# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Search::Contact, type: :service do
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
    let!(:contact1) { FactoryBot.create(:contact, patient_id: patient1.id) }
    let!(:contact2) { FactoryBot.create(:contact, patient_id: patient1.id) }
    let!(:contact3) { FactoryBot.create(:contact, patient_id: patient2.id) }
    let!(:contact4) { FactoryBot.create(:contact, patient_id: patient2.id) }
        
    params = {}

    it 'Shows all the Contacts' do
      service = Search::Contact.new(admin,params)
      x = Contact.all
      expect(service.fetch_data.count).to eq(x.count)
      expect(service.filter_data).to eq(nil)
      expect(service.fetch_data).to include(Contact)
    end

    it 'Shows the Contacts of a Clinic if present in User' do
      service = Search::Contact.new(user1,params)
      x = Contact.joins(:patient).where(patients: { clinic_id: user1.clinic_id })
      expect(service.fetch_data.count).to eq(x.count)
      expect(service.filter_data).to eq(nil)
      expect(service.fetch_data).to include(Contact)
    end

    it 'Returns nothing' do
      service = Search::Contact.new(user3,params)
      x = Contact.joins(:patient).where(patients: { clinic_id: user3.clinic_id })
      expect(service.fetch_data.count).to eq(x.count)
      expect(service.filter_data).to eq(nil)
      expect(service.fetch_data).to be_empty
    end

  end
end
