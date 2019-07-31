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

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory"
  it "is invalid without an email"
  it "is invalid without a firstname"
  it "is invalid without a lastname"
  it "returns a contact's full name as a string"
end
