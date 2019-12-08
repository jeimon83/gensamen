class AddInternmentToHelpRequest < ActiveRecord::Migration[6.0]
  def change
    add_reference :help_requests, :internment, foreign_key: true
  end
end
