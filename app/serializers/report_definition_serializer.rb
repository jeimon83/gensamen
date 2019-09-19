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

class ReportDefinitionSerializer < ActiveModel::Serializer
  attributes :id, :name, :type, :periodicity, :text
end
