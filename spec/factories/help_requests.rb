# == Schema Information
#
# Table name: help_requests
#
#  id             :bigint           not null, primary key
#  requested_date :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  internment_id  :bigint
#  clinic_id      :bigint
#  description    :text
#  title          :string
#

FactoryBot.define do
  factory :help_request do
    clinic_id { clinic.id }
    requested_date { FFaker::Time.date }
    title { "título" }
    description { "descripción" }
  end
end
