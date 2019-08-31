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
  context 'Do validation tests' do
    let(:contact) { build(:contact) }
    it 'Ensures name presence' do
      contact.firstname = nil
      expect(contact.valid?).to eq(false)
    end
    it 'Ensures lastname presence' do
      contact.lastname = nil
      expect(contact.valid?).to eq(false)
    end
    it 'Ensures phone presence' do
      contact.phone = nil
      expect(contact.valid?).to eq(false)
    end
    it 'Ensures document number presence' do
      contact.document_number = nil
      expect(contact.valid?).to eq(false)
    end
    it 'Should save successfully 2' do
      expect(contact.save).to eq(true)
    end
  end
  context 'Testing Patient relation' do
    it 'Belongs to a Patient' do
      expect { FactoryBot.build(:contact).patient }.to_not raise_error
    end
    it 'Belongs to Patient Test Nº2' do
      assc = Contact.reflect_on_association(:patient)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
