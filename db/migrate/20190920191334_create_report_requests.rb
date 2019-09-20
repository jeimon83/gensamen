class CreateReportRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :report_requests do |t|
      t.references :clinic, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.date :requested_date
      t.string :type
      t.date :expiration_date
      t.string :answer

      t.timestamps
    end
  end
end
