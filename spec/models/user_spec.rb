# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Do validation tests' do
    let(:user) { build(:user) }
    it 'Ensures first name presence' do
      user.first_name = nil
      expect(user.save).to eq(false)
    end
    it 'Ensures last name presence' do
      user.last_name = nil
      expect(user.save).to eq(false)
    end
    it 'Ensures email presence' do
      user.email = nil
      expect(user.save).to eq(false)
    end
    it 'Ensures password presence' do
      user.password = nil
      expect(user.save).to eq(false)
    end
    it 'Should save successfully' do
      expect(user.save).to eq(true)
    end
  end
end
