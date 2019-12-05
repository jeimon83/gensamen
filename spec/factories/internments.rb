# frozen_string_literal: true

# == Schema Information
#
# Table name: internments
#
#  id         :bigint           not null, primary key
#  begin_date :date
#  type       :string
#  end_date   :date
#  patient_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :internment, class: Internment do
    begin_date { '12/08/2019' }
    type { 'Voluntaria' }
    end_date { nil }
    association :patient, strategy: :build
    patient_id { patient.id }
  end
end
