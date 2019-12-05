# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Search::Patient, type: :service do
    let(:service) { described_class.new(user,params) }
    let!(:clinic) { FactoryBot.create(:clinic) }
    let!(:admin_user) { FactoryBot.create(:user) }
    let!(:common_user) { FactoryBot.create(:user, clinic_id: clinic.id) }
    let!(:patient) { FactoryBot.create(:patient, clinic_id: clinic.id) }
    let!(:other_patient) { FactoryBot.create(:patient) }
    let(:params) { {} }

    describe 'Search Service' do
      context 'when user is admin' do
        let(:user) { admin_user }
          
        it 'shows all the patients' do
          service.run

          expect(service.data.count).to eq(Patient.all.count)
          expect(service.data).to include(*Patient.all)
        end
      end

      context 'when user is not admin' do
        let(:user) { common_user }

        it 'returns the proper patient' do
          service.run

          expect(service.data.count).to eq(1)
          expect(service.data).to include(patient)
          expect(service.data).not_to include(other_patient)
        end
      end
   end
end