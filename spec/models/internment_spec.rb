# frozen_string_literal: true

# == Schema Information
#
# Table name: internments
#
#  id         :bigint           not null, primary key
#  begin_date :date
#  type       :string
#  end_date   :date
#  patient_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Internment, type: :model do
  let!(:patient) { FactoryBot.create(:patient) }
  let!(:other_patient) { FactoryBot.create(:patient) }
  let!(:internment) { FactoryBot.create(:internment, patient_id: patient.id) }
  let!(:other_internment) { FactoryBot.build(:internment, patient_id: patient.id) }
  
  describe 'model attributes' do
    context 'validation tests' do
  
      it 'ensures begin date presence' do
        internment.begin_date = nil
        expect(internment.valid?).to eq(false)
      end
      it 'ensures type of internment presence' do
        internment.type = nil
        expect(internment.valid?).to eq(false)
      end
      it 'will not create another if internment is open' do
        expect(other_internment.save).to eq(false)
      end
      it 'should save correctly' do
        expect(internment.save).to eq(true)
      end
    end

    context 'testing patient relation' do
      it 'does belongs to a patient test nº1' do
        expect { FactoryBot.build(:internment).patient }.to_not raise_error
      end
      it 'does belongs to a patient test nº2' do
        assc = Internment.reflect_on_association(:patient)
        expect(assc.macro).to eq :belongs_to
      end
      it 'does belongs to a patient test nº3' do
        expect(Internment.reflect_on_association(:patient).macro).to eq :belongs_to
      end
    end
  end
end
