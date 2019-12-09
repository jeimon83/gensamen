# == Schema Information
#
# Table name: report_requests
#
#  id              :bigint           not null, primary key
#  requested_date  :date
#  type            :string
#  expiration_date :date
#  answer          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  internment_id   :bigint
#

require 'rails_helper'

RSpec.describe ReportRequest, type: :model do
  let!(:internment) { FactoryBot.create(:internment) }
  let(:subject) { described_class.new(internment_id: internment.id, requested_date: '20/02/2020', type: 'Tipo') }

  describe 'model attributes' do
    context 'validation tests' do
      it 'ensures requested_date presence' do
        subject.requested_date = nil
        expect(subject.valid?).to eq(false)
      end
      it 'ensures type presence' do
        subject.type = nil
        expect(subject.valid?).to eq(false)
      end
      it 'saves successfully' do
        expect(subject.save).to eq(true)
      end
      it 'belongs to internment' do
        assc = ReportRequest.reflect_on_association(:internment)
        expect(assc.macro).to eq :belongs_to
      end
      it 'belongs to internment' do
        assc = ReportRequest.reflect_on_association(:internment)
        expect(assc.macro).to eq :belongs_to
      end

    end
  end
end
