class RemoveClinicFromHelpRequest < ActiveRecord::Migration[6.0]
  def change
    remove_column :help_requests, :clinic_id, :bigint
  end
end
