# frozen_string_literal: true

# == Schema Information
#
# Table name: contacts
#
#  id              :bigint           not null, primary key
#  patient_id      :bigint           not null
#  lastname        :string
#  firstname       :string
#  document_type   :string
#  document_number :string
#  relationship    :string
#  phone           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Contact Model
class Contact < ApplicationRecord
  belongs_to :patient

  validates :firstname, :lastname, :phone, presence: true
  validates :document_number, presence: true, uniqueness: true

  scope :by_clinic, -> (clinic_id) {
    joins(:patient).where(patients: { clinic_id: clinic_id })
  }
end
