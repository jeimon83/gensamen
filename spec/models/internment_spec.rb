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
  context 'Do validation tests' do
    @patient = FactoryBot.create(:patient)
    internment = FactoryBot.create(:internment, patient: @patient)
    it 'Ensures begin date presence' do
      internment.begin_date = nil
      expect(internment.valid?).to eq(false)
    end
    it 'Ensures type of internment presence' do
      internment.type = nil
      expect(internment.valid?).to eq(false)
    end
  end
  context 'Should Save Successfully' do
    internment = FactoryBot.build(:internment).patient
    it 'Should save correctly' do
      expect(internment.save).to eq(true)
    end
  end
  context 'Testing Patient relation' do
    it 'Belongs to a Patient Test Nº1' do
      expect { FactoryBot.build(:internment).patient }.to_not raise_error
    end
    it 'Belongs to Patient Test Nº2' do
      assc = Internment.reflect_on_association(:patient)
      expect(assc.macro).to eq :belongs_to
    end
    it 'Belongs to Patient Test Nº3' do
      expect(Internment.reflect_on_association(:patient).macro).to eq :belongs_to
    end
  end
end
