# frozen_string_literal: true

# == Schema Information
#
# Table name: clinics
#
#  id             :bigint           not null, primary key
#  name           :string
#  cuit           :string
#  habilitation   :string
#  beds_voluntary :integer
#  beds_judicial  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

# Clinic Model
class Clinic < ApplicationRecord
  has_many :patients
  has_many :internments, through: :patients
  has_many :users, dependent: :nullify

  validates :name, :habilitation, :cuit, presence: true

  validate :ban_nil_beds, on: :update

  scope :by_clinic, -> (clinic_id) {
      where(id: clinic_id)
  }

  def clinic_id
    self.id
  end

  def total_beds(bed_type)
    self.beds_judicial if bed_type == 'judicial'
    self.beds_voluntary if bed_type == 'voluntario'
  end

  def ban_nil_beds
    return true if not beds_judicial.nil? || beds_voluntary.nil?

    errors.add(:base, 'Atención! No se pueden actualizar las camas de la Clínica')
  end
  # revisar update de camas si hay internaciones activas
end
