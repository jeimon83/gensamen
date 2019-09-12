# frozen_string_literal: true

# == Schema Information
#
# Table name: help_requests
#
#  id         :bigint           not null, primary key
#  clinic_id  :bigint           not null
#  patient_id :bigint           not null
#  date       :date
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Help Request Serializer
class HelpRequestSerializer < ActiveModel::Serializer
  attributes :id, :date, :type
  belongs_to :clinic
  belongs_to :patient, optional: true
end
