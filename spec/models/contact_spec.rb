# frozen_string_literal: true

# == Schema Information
#
# Table name: contacts
#
#  id              :bigint           not null, primary key
#  patient_id      :bigint           not null
#  lastname        :string
#  firstname       :string
#  document_type   :string
#  document_number :string
#  relationship    :string
#  phone           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Contact, type: :model do
  let!(:patient) { FactoryBot.create(:patient) }
  let(:subject) { described_class.new(firstname: 'Juan', lastname: 'Perez', document_number: '2222222', phone: '4523-3419', patient_id: patient.id) } 
  
  describe 'model attributes' do
    context 'validation tests' do
      it 'ensures firstname presence' do
        subject.firstname = nil
        expect(subject.valid?).to eq(false)
      end
      it 'ensures lastname presence' do
        subject.lastname = nil
        expect(subject.valid?).to eq(false)
      end
      it 'ensures document number presence' do
        subject.document_number = nil
        expect(subject.valid?).to eq(false)
      end
      it 'ensures phone presence' do
        subject.phone = nil
        expect(subject.valid?).to eq(false)
      end
      it 'belongs to a patient' do
        expect { subject.patient }.to_not raise_error
      end
      it 'saves successfully' do
        expect(subject.save).to eq(true)
      end
    end
  end
end
