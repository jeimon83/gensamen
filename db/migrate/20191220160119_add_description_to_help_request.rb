class AddDescriptionToHelpRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :help_requests, :description, :text
  end
end
