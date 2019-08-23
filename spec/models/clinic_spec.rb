# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Clinic, type: :model do
  context 'Do validation tests' do
    it 'Ensures name presence' do
      clinic = Clinic.new(habilitation: "222-XX", cuit: "23-31060702-9")
      expect(clinic.valid?).to eq(false)
    end
    it 'Ensures habilitation presence' do
      clinic = Clinic.new(name: "Clinic", cuit: "23-31060702-9")
      expect(clinic.valid?).to eq(false)
    end
    it 'Ensures cuit presence' do
      clinic = Clinic.new(name: "Clinic", habilitation: "222-XX")
      expect(clinic.valid?).to eq(false)
    end
    it 'Should save successfully' do
      clinic = Clinic.new(name: "Clinica", habilitation: "222-XX", cuit: "23-31060702-9")
      expect(clinic.save).to eq(true)
    end
  end
end
