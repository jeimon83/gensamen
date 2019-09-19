class ReportDefinition < ApplicationRecord
  self.inheritance_column = :_type_disabled
  validates :name, :type, :periodicity, presence: true
end
