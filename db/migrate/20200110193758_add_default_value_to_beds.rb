class AddDefaultValueToBeds < ActiveRecord::Migration[6.0]
  def change
    change_column :clinics, :beds_judicial, :integer, default: 0
    change_column :clinics, :beds_voluntary, :integer, default: 0  
  end
end
