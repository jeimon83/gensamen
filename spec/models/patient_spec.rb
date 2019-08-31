# frozen_string_literal: true

# == Schema Information
#
# Table name: patients
#
#  id              :bigint           not null, primary key
#  lastname        :string
#  firstname       :string
#  document_type   :string
#  document_number :string
#  gender          :string
#  birth_date      :date
#  address         :string
#  department      :string
#  state           :string
#  city            :string
#  postal_code     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  clinic_id       :bigint
#  medical_record  :text
#


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
