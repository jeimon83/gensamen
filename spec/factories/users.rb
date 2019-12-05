# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  phone           :string
#  role            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  clinic_id       :bigint
#

FactoryBot.define do
  factory :user, class: User do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    clinic_id { nil }

    trait :admin do
      role { 'admin' }
    end

    trait :supervisor do
      role { 'supervisor' }
    end

    trait :operador do
      role { 'operador' }
    end

    trait :supervisor_clinica do
      role { 'supervisor_clinica' }
      association :clinic, strategy: :build
      clinic_id { clinic.id }
    end

    trait :operador_clinica do
      role { 'operador_clinica' }
      association :clinic, strategy: :build
      clinic_id { clinic.id }
    end
  end
end
