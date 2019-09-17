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

class HelpRequest < ApplicationRecord
  validates :requested_date, :type, presence: true
  belongs_to :clinic
  belongs_to :patient, optional: true

  has_many_attached :documents
end
