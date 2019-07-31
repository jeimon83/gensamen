class CreateClinics < ActiveRecord::Migration[6.0]
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :cuit
      t.string :habilitation
      t.integer :beds_voluntary
      t.integer :beds_judicial

      t.timestamps
    end
  end
end
