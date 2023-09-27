class ReportMailer < ApplicationMailer
  def send_report(email, urls)
    @urls = urls
    mail(to: email, subject: 'URL History Report')
  end
end
