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


FactoryBot.define do
  factory :clinic do
    name  { "Clínica" }
    cuit { "23310607029" }
    habilitation { "222-XX" }
    beds_voluntary { "2" }
    beds_judicial { "0" }
  end
end
