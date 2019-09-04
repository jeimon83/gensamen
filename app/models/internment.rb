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
# Internment Model
class Internment < ApplicationRecord
  self.inheritance_column = :_type_disabled
  validates :begin_date, :type, presence: true
  belongs_to :patient

  scope :by_clinic, -> (clinic_id) {
    joins(:patient).where(patients: { clinic_id: clinic_id })
  }

  delegate :clinic_id, to: :patient
end
