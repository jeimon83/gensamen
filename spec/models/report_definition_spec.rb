# == Schema Information
#
# Table name: report_definitions
#
#  id              :bigint           not null, primary key
#  name            :string
#  type            :string
#  period_type     :string
#  period_quantity :integer
#  text            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe ReportDefinition, type: :model do
  let(:subject) { described_class.new(name: 'Reporte', type: 'Tipo', period_type: 'Mensual', period_quantity: 2, text: 'Texto') }

  describe 'model attributes' do
    context 'validation tests' do
      it 'ensures name presence' do
        subject.name = nil
        expect(subject.valid?).to eq(false)
      end
      it 'ensures type presence' do
        subject.type = nil
        expect(subject.valid?).to eq(false)
      end
      it 'ensures period_type presence' do
        subject.period_type = nil
        expect(subject.valid?).to eq(false)
      end
      it 'ensures period_type presence' do
        subject.period_quantity = nil
        expect(subject.valid?).to eq(false)
      end
      it 'saves successfully' do
        expect(subject.save).to eq(true)
      end
    end
  end
end
