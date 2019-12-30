class AddClinicToHelpRequest < ActiveRecord::Migration[6.0]
  def change
    add_reference :help_requests, :clinic, foreign_key: true
  end
end
