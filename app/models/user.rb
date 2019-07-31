# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  belongs_to :clinic, optional: true
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }
  has_secure_password

  def full_name
    [first_name, last_name].join(' ')
  end

  ROLES = [
    'admin',
    'supervisor',
    'operador',
    'supervisor_clinica',
    'operador_clinica'
  ].freeze

  scope :admins, -> { where(role: 'admin') }
  scope :supervisors, -> { where(role: 'supervisor') }
  scope :operators, -> { where(role: 'operador') }
  scope :clinic_supervisors, -> { where(role: 'supervisor_clinica') }
  scope :clinic_operators, -> { where(role: 'operador_clinica') }

  ROLES.each do |role|
    define_method :"#{role}?" do
      send(:role) == role
    end
  end
end
