# frozen_string_literal: true

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
class ReportRequestSerializer < ActiveModel::Serializer
  attributes :id, :requested_date, :type, :expiration_date, :answer
  belongs_to :internment
end
