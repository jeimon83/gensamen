class ReportRequest < ApplicationRecord
  belongs_to :clinic
  belongs_to :patient, optional: true

  has_many_attached :documents
end
