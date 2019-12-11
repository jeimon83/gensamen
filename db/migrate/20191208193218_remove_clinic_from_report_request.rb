class RemoveClinicFromReportRequest < ActiveRecord::Migration[6.0]
  def change
    remove_column :report_requests, :clinic_id, :bigint
  end
end
