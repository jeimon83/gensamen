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
# Help Request Model
class HelpRequest < ApplicationRecord
  belongs_to :clinic
  belongs_to :patient
end
