# == Schema Information
#
# Table name: report_requests
#
#  id              :bigint           not null, primary key
#  clinic_id       :bigint           not null
#  patient_id      :bigint           not null
#  requested_date  :date
#  type            :string
#  expiration_date :date
#  answer          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe ReportRequest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
