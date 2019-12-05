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
  validates :name, :habilitation, :cuit, presence: true
  has_many :patients
  has_many :users, dependent: :nullify

  scope :by_clinic, -> (clinic_id) {
    where(id: clinic_id)
  }

  def clinic_id
    self.id
  end
end
