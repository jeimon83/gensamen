class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.references :department, foreign_key: true, index: true

      t.timestamps
    end
  end
end
