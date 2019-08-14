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

class PatientSerializer < ActiveModel::Serializer
  attributes :id, :lastname, :firstname, :document_type, :document_number, :gender, :birth_date,
             :address, :department, :state, :city, :postal_code
end
