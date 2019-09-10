# frozen_string_literal: true

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
# Model ReportRequest
class ReportRequest < ApplicationRecord
  belongs_to :clinic
  belongs_to :patient, optional: true

  has_many_attached :documents
end
