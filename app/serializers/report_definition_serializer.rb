class ReportDefinitionSerializer < ActiveModel::Serializer
  attributes :id, :name, :type, :periodicity, :text
end
