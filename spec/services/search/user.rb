# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Search::User, type: :service do
  context 'Service' do
    let!(:clinic) { FactoryBot.create(:clinic) }
    let!(:user) { FactoryBot.create(:user, clinic_id: clinic.id) }
    params = {}
    it 'Shows only one User' do
      service = Search::User.new(user,params)
      expect(service.fetch_data.count).to eq(1)
      expect(service.filter_data).to eq(nil)
      expect(service.fetch_data).not_to be_empty
      expect(service.fetch_data).to include(User)
    end
    it 'Search all the Users' do
      user.clinic_id = nil
      service = Search::User.new(user,params)
      x = User.all
      expect(service.fetch_data.count).to eq(x.count)
      expect(service.filter_data).to eq(nil)
      expect(service.data).to contain_exactly(*x)
    end    
  end
end
