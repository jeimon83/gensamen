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
  belongs_to :clinic, optional: true
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }
  has_secure_password

  def full_name
    [first_name, last_name].join(' ')
  end

  ROLES = ['admin','supervisor','operador','supervisor_clinica','operador_clinica'].freeze

  ROLES.each do |role|
    scope role, -> { where(role: role) }
    define_method :"#{role}?" do
      send(:role) == role
    end
  end
end
