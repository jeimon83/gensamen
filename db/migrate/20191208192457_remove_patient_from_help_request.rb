class RemovePatientFromHelpRequest < ActiveRecord::Migration[6.0]
  def change
    remove_column :help_requests, :patient_id, :bigint
  end
end
