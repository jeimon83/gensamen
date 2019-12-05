# frozen_string_literal: true

# == Schema Information
#
# Table name: clinics
#
#  id             :bigint           not null, primary key
#  name           :string
#  cuit           :string
#  habilitation   :string
#  beds_voluntary :integer
#  beds_judicial  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Clinic, type: :model do
  let(:subject) { described_class.new(name: 'Nombre', cuit: '23310607029', habilitation: '3451') }

  describe 'model attributes' do
    context 'validation tests' do
      it 'ensures name presence' do
        subject.name = nil 
        expect(subject.valid?).to eq(false)
      end
      it 'ensures habilitation presence' do
        subject.habilitation = nil
        expect(subject.valid?).to eq(false)
      end
      it 'ensures cuit presence' do
        subject.cuit = nil
        expect(subject.valid?).to eq(false)
      end
      it 'saves successfully' do
        expect(subject.save).to eq(true)
      end
    end 
  end
end
