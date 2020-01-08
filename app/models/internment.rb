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
class Internment < ApplicationRecord
  self.inheritance_column = :_type_disabled
  belongs_to :patient
  has_many :help_requests
  has_many :report_requests
  has_many :comments, as: :commentable

  validates :begin_date, :type, presence: true
  validate :internment_open, on: :create
  validate :beds_availability, on: :create

  scope :by_clinic, -> (clinic_id) { 
    joins(:patient).where(patients: { clinic_id: clinic_id })
  }

  scope :open, -> { where(end_date: nil) }

  delegate :clinic_id, to: :patient

  def internment_open
    return true unless self.patient.internments.where(end_date: nil).any?

    self.errors.add(:base, 'El paciente ya tiene una internación abierta')
  end

  def beds_availability
    beds_available = self.patient.clinic.total_beds
    beds_used = self.patient.clinic.internments.open
    return true if beds_used < beds_available
    self.errors.add(:base, 'La Clínica no tiene camas disponibles') 
    
  end
end
