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
  validate :internment_open?
  belongs_to :patient

  scope :by_clinic, -> (clinic_id) {
    joins(:patient).where(patients: { clinic_id: clinic_id })
  }

  delegate :clinic_id, to: :patient

  def internment_open?
    open_internment = self.internments.where(end_date: nil).any?
    self.errors.add(:base, "El paciente ya tiene una internación abierta") if open_interment
  end

end
