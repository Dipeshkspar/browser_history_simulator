class ReportMailer < ApplicationMailer
  def send_report(email, urls)
    @urls = urls
    mail(to: email, from: 'postmaster@sandbox15022f74c0b04b72bcfd0410890b6978.mailgun.org', subject: 'URL History Report')
  end
end
