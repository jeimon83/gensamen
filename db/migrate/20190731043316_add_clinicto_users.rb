class AddClinictoUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :clinic, foreign_key: true
  end
end
