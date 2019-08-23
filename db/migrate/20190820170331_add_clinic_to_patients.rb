class AddClinicToPatients < ActiveRecord::Migration[6.0]
  def change
    add_reference :patients, :clinic, foreign_key: true
  end
end
