# frozen_string_literal: true

FactoryBot.define do
  factory :patient, class: Patient do
    firstname { FFaker::Name.first_name }
    lastname { FFaker::Name.last_name }
    document_number { FFaker::Identification.ssn }
    clinic_id { FFaker::Identification.ssn }
  end
end
