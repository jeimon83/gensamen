# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'Do validation tests' do
    let(:contact) { build(:contact) }
    it 'Ensures name presence' do
      contact.firstname = nil
      expect(contact.save).to eq(false)
    end
    it 'Ensures lastname presence' do
      contact.lastname = nil
      expect(contact.save).to eq(false)
    end
    it 'Ensures phone presence' do
      contact.phone = nil
      expect(contact.save).to eq(false)
    end
    it 'Ensures document number presence' do
      contact.document_number = nil
      expect(contact.save).to eq(false)
    end
  end
  context "Testing Patient relation" do
    it "Belongs to a Patient" do
      expect { FactoryBot.build(:contact).patient }.to_not raise_error
    end
    it "Belongs to Patient Test Nº2" do
      assc = Contact.reflect_on_association(:patient)
      expect(assc.macro).to eq :belongs_to
    end
  end
end