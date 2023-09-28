class EmailReportWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(email, urls)
    ReportMailer.send_report(email, urls).deliver_now
  end
end
