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
  validates :name, :habilitation, presence: true
  validate :valid
  has_many :patients
  has_many :users

  def valid
    @message = 'El CUIT no puede ser nulo' unless cuit.present?
    @message = 'El CUIT no es valido' unless valid_cuit
    errors.add(:cuit, @message) unless @message.blank?
  end

  def valid_cuit
    return false unless cuit.present?

    raw_cuit = cuit.remove('-')
    return false if raw_cuit.size != 11

    arre_validador = '54327654321'.split('') # armo array separando digitos
    arre_cuit = raw_cuit.split('')
    suma = arre_validador.zip(arre_cuit).inject(0) { |sum, par_ordenado|
      sum += par_ordenado.first.to_i * par_ordenado.second.to_i
    }
    suma.multiple_of?(11) # verificamos si la suma es multiplo de 11
  end
end
