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
  validate :beds_qty, on: :update

  scope :by_clinic, lambda { |clinic_id|
    where(id: clinic_id)
  }

  def clinic_id
    id
  end

  def total_beds(bed_type)
    beds_judicial if bed_type == 'judicial'
    beds_voluntary if bed_type == 'voluntario'
  end

  def ban_nil_beds
    return true unless beds_judicial.nil? || beds_voluntary.nil?

    errors.add(:base, 'No se pueden actualizar las camas a nil')
  end

  def beds_qty
    return true if voluntary && judicial

    errors.add(:base, 'No puede haber menos camas que internaciones activas')
  end

  def voluntary
    beds_voluntary >= active_voluntary_internments
  end

  def judicial
    beds_judicial >= active_judicial_internments
  end

  def active_judicial_internments
    internments.open_judicial.count
  end

  def active_voluntary_internments
    internments.open_voluntary.count
  end
end
