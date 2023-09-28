require 'rails_helper'

RSpec.feature 'URL History', type: :feature, js: true do
  scenario 'User saves a URL' do
    expect(UrlHistory.count).to eq(0)

    visit root_path

    fill_in 'url', with: 'https://example.com', match: :prefer_exact
    click_button 'Go'

    expect(UrlHistory.count).to eq(1)
    created_url_history = UrlHistory.first
    expect(created_url_history.url).to eq('https://example.com')
  end
end
