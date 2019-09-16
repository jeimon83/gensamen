# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Search::User, type: :service do
  let(:service) { described_class.new(user, params) }
  let!(:clinic) { FactoryBot.create(:clinic) }
  let!(:admin_user) { FactoryBot.create(:user, :admin) }
  let!(:common_user) { FactoryBot.create(:user, clinic_id: clinic.id) }
  let(:params) { {} }

  describe 'Search Service' do
    context 'when user is admin' do
      let(:user) { admin_user }

      it 'shows all the users' do
        service.run

        expect(service.data.count).to eq(User.count)
        expect(service.data).to contain_exactly(*User.all)
      end
    end

    context 'when user is not admin' do
      let(:user) { common_user }

      it 'returns the proper user' do
        service.run

        expect(service.data.count).to eq(1)
        expect(service.data).to include(common_user)
        expect(service.data).not_to include(admin_user)
      end
    end
  end
end
