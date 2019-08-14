class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :lastname
      t.string :firstname
      t.string :document_type
      t.string :document_number
      t.string :gender
      t.date :birth_date
      t.string :address
      t.string :department
      t.string :state
      t.string :city
      t.string :postal_code

      t.timestamps
    end
  end
end
