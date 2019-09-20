# == Schema Information
#
# Table name: report_requests
#
#  id              :bigint           not null, primary key
#  clinic_id       :bigint           not null
#  patient_id      :bigint           not null
#  requested_date  :date
#  type            :string
#  expiration_date :date
#  answer          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :report_request do
    clinic_id { clinic.id }
    patient_id { patient.id }
    requested_date { FFaker::Time.date }
    type { "tipo" }
    expiration_date { nil }
    answer { "answer" }
  end
end
