require 'rails_helper'

RSpec.describe ReportMailer, type: :mailer do
  let(:email) { 'user@example.com'}

  describe 'send_report' do
    let(:mail) { ReportMailer.send_report(email, ['https://example1.com']) }

    it 'renders the subject' do
      expect(mail.subject).to eq('URL History Report')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq(['user@example.com'])
    end

    it 'assigns @url_history_urls' do
      expect(mail.body.encoded).to match('https://example1.com')
    end
  end
end