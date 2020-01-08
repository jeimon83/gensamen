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
class ClinicSerializer < ActiveModel::Serializer
  attributes :id, :name, :cuit, :habilitation, :beds_voluntary, :beds_judicial, :internments_enabled

  def internments_enabled
    self.object.beds_voluntary.to_i + self.object.beds_judicial.to_i
  end
end
