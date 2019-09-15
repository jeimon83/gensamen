# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  phone           :string
#  role            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  clinic_id       :bigint
#

# User Model
class User < ApplicationRecord
  has_secure_password

  belongs_to :clinic, optional: true

  validates :first_name, :last_name, :role, presence: true
  validates :email, presence: true, uniqueness: true

  before_validation :set_defaults

  scope :by_clinic, -> (clinic_id) {
    where(clinic_id: clinic_id)
  }

  def full_name
    [first_name, last_name].join(' ')
  end

  ROLES = ['admin', 'supervisor', 'operador', 'supervisor_clinica', 'operador_clinica'].freeze

  ROLES.each do |role|
    scope role, -> { where(role: role) }
    define_method :"#{role}?" do
      send(:role) == role
    end
  end

  def set_defaults
    self.role ||= 'operador'
  end

  def to_json
    {
      first_name: self.first_name,
      last_name:  self.last_name,
      email:      self.email,
      clinic_id:  self.clinic_id,
      role:       self.role
    }
  end
end
