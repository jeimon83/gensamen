# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'Do validation tests' do
    it 'Ensures name presence' do
      contact = Contact.new(lastname: "GM", document_number: "22", phone: "3333", patient_id: 1)
      expect(contact.save).to eq(false)
    end
    it 'Ensures lastname presence' do
      contact = Contact.new(firstname: "Jaime", document_number: "22", phone: "3333", patient_id: 1)
      expect(contact.save).to eq(false)
    end
    it 'Ensures phone presence' do
      contact = Contact.new(firstname: "Jaime", lastname: "GM", document_number: "22", patient_id: 1)
      expect(contact.save).to eq(false)
    end
    it 'Ensures document number presence' do
      contact = Contact.new(firstname: "Jaime", lastname: "GM", phone: "3333", patient_id: 1)
      expect(contact.save).to eq(false)
    end
    it 'Ensures that belongs to Patient' do
      contact = Contact.new(firstname: "Jaime", lastname: "GM", document_number: "22", phone: "3333")
      expect(contact.save).to eq(false)
    end
  end
end