class CreateInternments < ActiveRecord::Migration[6.0]
  def change
    create_table :internments do |t|
      t.date :begin_date
      t.string :type
      t.date :end_date
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
