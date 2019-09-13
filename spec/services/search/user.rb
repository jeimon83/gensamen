# frozen_string_literal: true

require 'rails_helper'

#RSpec.describe ClinicsController, type: :controller do
RSpec.describe Search::User do
  context 'Service' do
    let!(:clinic) { FactoryBot.create(:clinic) }
    let!(:user) { FactoryBot.create(:user, clinic_id: clinic.id) }
    params = {}
    it 'Search all the Users' do
      user.clinic_id = nil
      service = Search::User.new(user,params)
      x = User.all
      expect(service.fetch_data.count).to eq(x.count)
      expect(service.filter_data).to eq(nil)
      expect(service.data).to contain_exactly(*x)
    end
    it 'Shows only one User' do
      x = user.clinic_id
      puts x
      puts user.clinic_id
      user = User.find_by(clinic_id: x)
      puts user
      service = Search::User.new(user,params)
      expect(service.fetch_data.count).to eq(1)
      expect(service.filter_data).to eq(nil)
      expect(service.fetch_data).not_to be_empty
      #expect(service.fetch_data).to equal(user)
      #expected = service.fetch_data
      #expect(user).to eq(expected)
    end
  end
end
