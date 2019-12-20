# == Schema Information
#
# Table name: help_requests
#
#  id             :bigint           not null, primary key
#  requested_date :date
#  type           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  internment_id  :bigint
#  clinic_id      :bigint
#  description    :text
#

FactoryBot.define do
  factory :help_request do
    clinic_id { clinic.id }
    requested_date { FFaker::Time.date }
    type { "tipo" }
  end
end
