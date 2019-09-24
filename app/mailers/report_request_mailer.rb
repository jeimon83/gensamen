class ReportRequestMailer < ApplicationMailer
  def send_report_request_email
    @user = params[:user]
    @report = params[:report]
    mail(to: @user.email, subject: 'Report Request')
  end
end
