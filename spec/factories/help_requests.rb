# == Schema Information
#
# Table name: help_requests
#
#  id             :bigint           not null, primary key
#  clinic_id      :bigint           not null
#  patient_id     :bigint           not null
#  requested_date :date
#  type           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :help_request do
    clinic_id { clinic.id }
    patient_id { patient.id }
    requested_date { FFaker::Time.date }
    type { "tipo" }
  end
end
