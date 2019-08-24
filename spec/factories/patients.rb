# frozen_string_literal: true

FactoryBot.define do
  factory :patient, class: Patient do
    firstname { FFaker::Name.first_name }
    lastname { FFaker::Name.last_name }
    document_number { FFaker::Identification.ssn }
    association :clinic, strategy: :build
    clinic_id { clinic.id }
  end
end
