# == Schema Information
#
# Table name: report_requests
#
#  id              :bigint           not null, primary key
#  clinic_id       :bigint           not null
#  patient_id      :bigint           not null
#  date            :date
#  type            :string
#  expiration_date :date
#  answer          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :report_request do
    clinic { nil }
    patient { nil }
    date { "2019-09-10" }
    type { "" }
    expiration_date { "2019-09-10" }
    answer { "MyString" }
  end
end
