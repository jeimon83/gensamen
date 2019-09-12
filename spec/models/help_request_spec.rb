# == Schema Information
#
# Table name: help_requests
#
#  id         :bigint           not null, primary key
#  clinic_id  :bigint           not null
#  patient_id :bigint           not null
#  date       :date
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe HelpRequest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
