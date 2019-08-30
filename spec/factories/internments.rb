# frozen_string_literal: true

FactoryBot.define do
  factory :internment, class: Internment do
    begin_date { "12/08/2019" }
    type { "Voluntaria" }
    end_date { "14/09/2019" }
    association :patient, strategy: :build
    patient_id { patient.id }
  end
end