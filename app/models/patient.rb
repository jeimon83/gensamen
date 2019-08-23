# == Schema Information
#
# Table name: patients
#
#  id              :bigint           not null, primary key
#  lastname        :string
#  firstname       :string
#  document_type   :string
#  document_number :string
#  gender          :string
#  birth_date      :date
#  address         :string
#  department      :string
#  state           :string
#  city            :string
#  postal_code     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Patient < ApplicationRecord
  belongs_to :clinic
  has_many :internments
end
