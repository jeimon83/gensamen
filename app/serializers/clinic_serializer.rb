# == Schema Information
#
# Table name: clinics
#
#  id             :bigint           not null, primary key
#  name           :string
#  cuit           :string
#  habilitation   :string
#  number_of_beds :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ClinicSerializer < ActiveModel::Serializer
  attributes :id, :name, :cuit, :habilitation, :number_of_beds
end
