# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Search::Clinic, type: :service do
  let(:service) { described_class.new(user, params) }
  let!(:clinic) { FactoryBot.create(:clinic) }
  let!(:other_clinic) { FactoryBot.create(:clinic) }
  let!(:admin_user) { FactoryBot.create(:user, :admin) }
  let!(:common_user) { FactoryBot.create(:user, clinic_id: clinic.id) }
  let(:params) { {} }

  describe 'Search Service' do
    context 'when user is admin' do
      let(:user) { admin_user }

      it 'shows all the clinics' do
        service.run

        expect(service.data.count).to eq(Clinic.count)
        expect(service.data).to contain_exactly(*Clinic.all)
      end
    end

    context 'when user is not admin' do
      let(:user) { common_user }

      it 'returns the proper clinic' do
        service.run

        expect(service.data.count).to eq(1)
        expect(service.data).to include(clinic)
        expect(service.data).not_to include(other_clinic)
      end
    end
  end
end
