class AddInternmentToReportRequest < ActiveRecord::Migration[6.0]
  def change
    add_reference :report_requests, :internment, foreign_key: true
  end
end
