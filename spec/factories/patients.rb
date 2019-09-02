# frozen_string_literal: true

# == Schema Information
#
# Table name: patients
#
#  id              :bigint           not null, primary key
#  lastname        :string
#  firstname       :string
#  document_type   :string
#  document_number :string
#  gender          :string
#  birth_date      :date
#  address         :string
#  department      :string
#  state           :string
#  city            :string
#  postal_code     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  clinic_id       :bigint
#  medical_record  :text
#

FactoryBot.define do
  factory :patient, class: Patient do
    firstname { FFaker::Name.first_name }
    lastname { FFaker::Name.last_name }
    document_number { FFaker::Identification.ssn }
    association :clinic, strategy: :build
    clinic_id { clinic.id }
  end
end
