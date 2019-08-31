# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  phone           :string
#  role            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  clinic_id       :bigint
#

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Do validation tests' do
    let(:user) { build(:user) }
    it 'Ensures first name presence' do
      user.first_name = nil
      expect(user.valid?).to eq(false)
    end
    it 'Ensures last name presence' do
      user.last_name = nil
      expect(user.valid?).to eq(false)
    end
    it 'Ensures email presence' do
      user.email = nil
      expect(user.valid?).to eq(false)
    end
    it 'Ensures password presence' do
      user.password = nil
      expect(user.valid?).to eq(false)
    end
    it 'Should save successfully' do
      expect(user.save).to eq(true)
    end
  end
  context 'Test Full_Name method' do
    let(:user) { FactoryBot.build(:user, first_name: 'Jaime', last_name: 'GM') }
    it 'Should say: "Jaime GM"' do
      expect(user.full_name).to eq 'Jaime GM'
    end
  end
  context 'Testing Clinic relation' do
    it 'Belongs to a Clinic' do
      expect { FactoryBot.build(:user).clinic }.to_not raise_error
    end
    it 'Belongs to Clinic Test Nº2' do
      assc = User.reflect_on_association(:clinic)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
