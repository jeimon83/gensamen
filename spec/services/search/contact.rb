# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Search::Contact, type: :service do
  let(:service) { described_class.new(user, params) }
  let!(:admin_user) { FactoryBot.create(:user, :admin) }
  let!(:clinic) { FactoryBot.create(:clinic) }
  let!(:common_user) { FactoryBot.create(:user, clinic_id: clinic.id) }
  let!(:patient) { FactoryBot.create(:patient, clinic_id: clinic.id) }
  let!(:contact) { FactoryBot.create(:contact, patient_id: patient.id) }
  let(:params) { {} }  

  describe 'Search Service' do
    context 'when user is admin' do
      let(:user) { admin_user }
        
      it 'shows all the contacts' do
        service.run

        expect(service.data.count).to eq(Contact.all.count)
        expect(service.data).to include(*Contact.all)
      end
    end

    context 'when user is not admin' do
      let(:user) { common_user }

      it 'returns the proper contact' do
        x = Contact.joins(:patient).where(patients: { clinic_id: user.clinic_id })
        service.run

        expect(service.data.count).to eq(x.count)
        expect(service.data).to include(Contact)
      end
    end
   end
end