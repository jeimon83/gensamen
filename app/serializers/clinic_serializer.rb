# == Schema Information
#
# Table name: clinics
#
#  id             :bigint           not null, primary key
#  name           :string
#  cuit           :string
#  habilitation   :string
#  beds_voluntary :string
#  beds_judicial  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ClinicSerializer < ActiveModel::Serializer
  attributes :id, :name, :cuit, :habilitation, :beds_voluntary, :beds_judicial
end
