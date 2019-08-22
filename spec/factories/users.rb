# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    association :clinic, strategy: :build
    clinic_id {clinic.id}
  end
end
