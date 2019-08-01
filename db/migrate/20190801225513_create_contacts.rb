class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :lastname
      t.string :firstname
      t.string :document_type
      t.string :document_number
      t.string :relationship
      t.string :phone

      t.timestamps
    end
  end
end
