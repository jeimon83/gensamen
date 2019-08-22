# frozen_string_literal: true

require 'rails_helper'

class FullName
  def full_name
    first_name = "Jaime"
    last_name = "GM"
    [first_name, last_name].join(' ')
  end
end

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
     it "should say 'Jaime GM' when we call the full_name method" do 
         fn = FullName.new 
         message = fn.full_name 
         expect(message).to eq "Jaime GM"
      end
    it 'Should save successfully' do
      expect(user.save).to eq(true)
    end
  end
  context "Testing Clinic relation" do
    it "Belongs to a Clinic" do
      expect { FactoryBot.build(:user).clinic }.to_not raise_error
    end
    it "Belongs to Clinic Test Nº2" do
      assc = User.reflect_on_association(:clinic)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
