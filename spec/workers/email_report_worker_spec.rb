# require 'rails_helper'

# RSpec.describe EmailReportWorker, type: :worker do
#   let(:url_history1) { FactoryGirl.attributes_for(:url_history) }

#   it 'sends an email report' do
#     EmailReportWorker.perform_async('user_email@gmail.com', [url_history1])

#     perform_enqueued_jobs do
#       expect(ActionMailer::Base.deliveries.count).to eq(1)
#       email = ActionMailer::Base.deliveries.last
#       expect(email.to).to eq(['user_email@gmail.com'])
#     end
#   end
# end