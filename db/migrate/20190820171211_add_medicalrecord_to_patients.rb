class AddMedicalrecordToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :medical_record, :text
  end
end
