# frozen_string_literal: true

FactoryBot.define do
  factory :patient do
    lastname = "X"
    firstname = "Paciente"
    document_type = "DU"
    document_number = "31060702"
    gender = "Trans"
    birth_date = "30/04/1980"
  end
end