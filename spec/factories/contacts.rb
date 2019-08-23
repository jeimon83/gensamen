# frozen_string_literal: true

FactoryBot.define do
  factory :contact, class: Contact do
    firstname { FFaker::Name.first_name }
    lastname { FFaker::Name.last_name }
    document_number = "31060702"
    phone = "44444"
    association :patient, strategy: :build
    patient_id { patient.id }
  end
end
