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

class ReportRequest < ApplicationRecord
  self.inheritance_column = :_type_disabled
  validates :requested_date, :type, presence: true
  belongs_to :clinic
  belongs_to :patient

  has_many_attached :documents
end
