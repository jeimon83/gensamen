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

require 'test_helper'

class ClinicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
