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
    clinic { nil }
    patient { nil }
    requested_date { "2019-09-17" }
    type { "" }
  end
end
