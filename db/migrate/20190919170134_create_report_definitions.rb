class CreateReportDefinitions < ActiveRecord::Migration[6.0]
  def change
    create_table :report_definitions do |t|
      t.string :name
      t.string :type
      t.date :periodicity
      t.text :text

      t.timestamps
    end
  end
end
