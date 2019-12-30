# == Schema Information
#
# Table name: help_requests
#
#  id             :bigint           not null, primary key
#  requested_date :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  internment_id  :bigint
#  clinic_id      :bigint
#  description    :text
#  title          :string
#

require 'rails_helper'

RSpec.describe HelpRequest, type: :model do
  let!(:clinic) { FactoryBot.create(:clinic) }
  let(:subject) { described_class.new(clinic_id: clinic.id, requested_date: '20/02/2020') }

  describe 'model attributes' do
    context 'validation tests' do
      it 'ensures requested_date presence' do
        subject.requested_date = nil
        expect(subject.valid?).to eq(false)
      end
      it 'saves successfully' do
        expect(subject.save).to eq(true)
      end
      it 'belongs to clinic' do
        assc = HelpRequest.reflect_on_association(:clinic)
        expect(assc.macro).to eq :belongs_to
      end
    end
  end
end
