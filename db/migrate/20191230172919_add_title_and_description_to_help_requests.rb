class AddTitleAndDescriptionToHelpRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :help_requests, :text, :string
    add_column :help_requests, :description, :text
  end
end
