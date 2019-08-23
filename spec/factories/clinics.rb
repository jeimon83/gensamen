# frozen_string_literal: true

FactoryBot.define do
  factory :clinic do
    name = "Clínica"
    cuit = "23310607029"
    habilitation = "222-XX"
    beds_voluntary = "2"
    beds_judicial = "0"
  end
end