# == Schema Information
#
# Table name: report_definitions
#
#  id          :bigint           not null, primary key
#  name        :string
#  type        :string
#  periodicity :date
#  text        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe ReportDefinition, type: :model do
  let(:subject) { described_class.new(name: 'Reporte', type: 'Tipo', periodicity: '20/02/2020', text: 'bla bla bla') }

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
      it 'ensures periodicity presence' do
        subject.periodicity = nil
        expect(subject.valid?).to eq(false)
      end
      it 'saves successfully' do
        expect(subject.save).to eq(true)
      end
    end
  end
end

