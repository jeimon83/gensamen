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
  let!(:clinic) { FactoryBot.create(:clinic) }
  let(:subject) { described_class.new(firstname: 'Jaime', lastname: 'GM', document_number: '31060702', clinic: clinic) }

  describe 'model attributes' do
    context 'validation tests' do
      it 'ensures first name presence' do
        subject.firstname = nil
        expect(subject.valid?).to eq(false)
      end
      it 'ensures last name presence' do
        subject.lastname = nil
        expect(subject.valid?).to eq(false)
      end
      it 'ensures document number presence' do
        subject.document_number = nil
        expect(subject.valid?).to eq(false)
      end
      it 'saves successfully' do
        expect(subject.save).to eq(true)
      end
      it 'belongs to clinic test nº1' do
        expect { FactoryBot.create(:patient).clinic }.to_not raise_error
      end
      it 'belongs to clinic test nº2' do
        assc = Patient.reflect_on_association(:clinic)
        expect(assc.macro).to eq :belongs_to
      end
    end
  end
end
