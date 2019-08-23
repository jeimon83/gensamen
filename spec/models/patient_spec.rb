# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Patient, type: :model do
  context 'Do validation tests' do
    let(:patient) { build(:patient) }
    it 'Ensures first name presence' do
      patient.firstname = nil
      expect(patient.valid?).to eq(false)
    end
    it 'Ensures last name presence' do
      patient.lastname = nil
      expect(patient.valid?).to eq(false)
    end
    it 'Ensures document number presence' do
      patient.document_number = nil
      expect(patient.valid?).to eq(false)
    end
    it 'Should save successfully' do
      expect(patient.save).to eq(true)
    end
  end
  context 'Testing Clinic relation' do
    it 'Belongs to a Clinic' do
      expect { FactoryBot.build(:patient).clinic }.to_not raise_error
    end
    it 'Belongs to Clinic Test Nº2' do
      assc = Patient.reflect_on_association(:clinic)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
