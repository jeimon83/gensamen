class CreateConfigs < ActiveRecord::Migration[6.0]
  def change
    create_table :configs do |t|
      t.json :checklist

      t.timestamps
    end
  end
end
