class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.references :state, foreign_key: true, index: true

      t.timestamps
    end
  end
end
