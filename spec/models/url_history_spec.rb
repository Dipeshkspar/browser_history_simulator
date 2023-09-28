require 'rails_helper'

RSpec.describe UrlHistory, type: :model do
  it "is valid with a URL of at least 12 characters" do
    url_history = UrlHistory.new(url: "https://example.com/longurl")
    expect(url_history).to be_valid
  end

  it "is invalid with a URL less than 14 characters" do
    url_history = UrlHistory.new(url: "https://x.m")
    expect(url_history).to be_invalid
    expect(url_history.errors[:url]).to include("must be at least 12 characters long")
  end
end