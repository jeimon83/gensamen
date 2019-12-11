class RemovePatientFromReportRequest < ActiveRecord::Migration[6.0]
  def change
    remove_column :report_requests, :patient_id, :bigint
  end
end
