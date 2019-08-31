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
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :role, :first_name, :last_name, :full_name, :phone
  belongs_to :clinic, optional: true
end
