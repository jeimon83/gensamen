class RemoveTypeFromHelpRequests < ActiveRecord::Migration[6.0]
  def change
    remove_column :help_requests, :type, :string
  end
end
