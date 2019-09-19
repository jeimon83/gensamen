# == Schema Information
#
# Table name: report_definitions
#
#  id          :bigint           not null, primary key
#  name        :string
#  type        :string
#  periodicity :date
#  text        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe ReportDefinition, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
