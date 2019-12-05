# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  phone           :string
#  role            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  clinic_id       :bigint
#

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:subject) { described_class.new(email: 'a@a.com', first_name: 'A', last_name: 'B', password: '123qwe') }
  
  describe 'model attributes' do
    context 'validation tests' do
      it 'ensures first name presence' do
        subject.first_name = nil
        expect(subject.valid?).to eq(false)
      end
      it 'ensures last name presence' do
        subject.last_name = nil
        expect(subject.valid?).to eq(false)
      end
      it 'ensures email presence' do
        subject.email = nil
        expect(subject.valid?).to eq(false)
      end
      it 'ensures password presence' do
        subject.password = nil
        expect(subject.valid?).to eq(false)
      end
      it 'saves successfully' do
        expect(subject.save).to eq(true)
      end
    end
    context 'test full_name method' do
      it 'should say full name' do
        expect(subject.full_name).to eq "#{subject.first_name} #{subject.last_name}"
      end
    end
    context 'testing relations' do
      it 'belongs to clinic test nº1' do
        expect { FactoryBot.build(:user).clinic }.to_not raise_error
      end
      it 'belongs to clinic test nº2' do
        assc = User.reflect_on_association(:clinic)
        expect(assc.macro).to eq :belongs_to
      end
    end
  end
end
