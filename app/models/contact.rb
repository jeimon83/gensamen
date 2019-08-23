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

class Contact < ApplicationRecord
  validates_presence_of :firstname, :lastname, :phone
  validates :document_number, presence: true, uniqueness: true
  belongs_to :patient
end
