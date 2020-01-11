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

  # RECORDATORIO: LA CLINICA NO DEBERIA PERMITIR MODIFICAR LA CANTIDAD DE CAMAS
  # TANTO VOLUNTARIAS COMO JUDICIALES SI EXISTEN INTERNACIONES ACTIVAS

  #AGREGAR METODO QUE NO PERMITA ACTUALIZAR LAS CAMAS A NIL
end
