class ReportRequestMailer < ApplicationMailer
  def send_report_request_email(pdf_report)
    @user = User.find(1)
    @pdf_report = pdf_report      
    subject = "Reporte Automático: Internaciones Abiertas - Total: #{@pdf_report.count}"
    mail to: @user.email, subject: subject
  end
end
