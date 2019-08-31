# frozen_string_literal: true

# == Schema Information
#
# Table name: contacts
#
#  id              :bigint           not null, primary key
#  patient_id      :bigint           not null
#  lastname        :string
#  firstname       :string
#  document_type   :string
#  document_number :string
#  relationship    :string
#  phone           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :contact, class: Contact do
    firstname { FFaker::Name.first_name }
    lastname { FFaker::Name.last_name }
    document_number { '31060702' }
    phone { '44444' }
    association :patient, strategy: :build
    patient_id { patient.id }
  end
end
