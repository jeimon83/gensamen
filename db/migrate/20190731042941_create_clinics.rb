class CreateClinics < ActiveRecord::Migration[6.0]
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :cuit
      t.string :habilitation
      t.string :number_of_beds

      t.timestamps
    end
  end
end
