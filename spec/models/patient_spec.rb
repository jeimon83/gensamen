# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Patient, type: :model do
  context 'Do validation tests' do
    let(:patient) { build(:patient) }
    it 'Ensures first name presence' do
      patient.firstname = nil
      expect(patient.save).to eq(false)
    end
    it 'Ensures last name presence' do
      patient.lastname = nil
      expect(patient.save).to eq(false)
    end
    it 'Ensures document number presence' do
      patient.document_number = nil
      expect(patient.save).to eq(false)
    end
    it 'Ensures that belongs to Clinic' do
      patient.clinic_id = nil
      expect(patient.save).to eq(false)
    end
  end
end
