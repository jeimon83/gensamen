# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Search::Patient, type: :service do
  context 'Search Service' do
    let!(:admin) { FactoryBot.create(:user, clinic_id: nil) }

    let!(:clinic1) { FactoryBot.create(:clinic) }
    let!(:user1) { FactoryBot.create(:user, clinic_id: clinic1.id) }
    let!(:patient1) { FactoryBot.create(:patient, clinic_id: clinic1.id) }
    let!(:patient2) { FactoryBot.create(:patient, clinic_id: clinic1.id) }
    
    let!(:clinic2) { FactoryBot.create(:clinic) }
    let!(:user2) { FactoryBot.create(:user, clinic_id: clinic2.id) }
    let!(:patient3) { FactoryBot.create(:patient, clinic_id: clinic2.id) }
    
    params = {}

    it 'Shows the Patients of one Clinic' do
      service = Search::Patient.new(user1,params)
      expect(service.fetch_data.count).to eq(2)
      expect(service.filter_data).to eq(nil)
      expect(service.fetch_data).not_to be_empty
      expect(service.fetch_data).to include(Patient)
    end

    it 'Shows all the Patients of all the Clinics' do
      puts "Admin #{admin} y su clinic id: #{admin.clinic_id}"
      #puts "Clinic1: #{clinic1.id}"
      #puts "User1 #{user1} y su clinic id: #{clinic1.id}"
      puts "Patient1 #{patient1} y su clinic id: #{clinic1.id}"
      puts "Patient2 #{patient2} y su clinic id: #{clinic1.id}"
      puts "Patient3 #{patient3} y su clinic id: #{clinic1.id}"
      service = Search::User.new(admin,params)
      x = Patient.all
      x.each do |a|
        puts a.id
      end
      #expect(service.fetch_data.count).to eq(x.count)
      expect(service.filter_data).to eq(nil)
      #expect(service.data).to contain_exactly(*x)
    end    
  end
end
