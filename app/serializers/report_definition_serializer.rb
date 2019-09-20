# == Schema Information
#
# Table name: report_definitions
#
#  id              :bigint           not null, primary key
#  name            :string
#  type            :string
#  period_type     :string
#  period_quantity :integer
#  text            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ReportDefinitionSerializer < ActiveModel::Serializer
  attributes :id, :name, :type, :period_type, :period_quantity, :text
end
