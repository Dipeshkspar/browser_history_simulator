class UrlHistory < ApplicationRecord
  validate :url_length_must_be_at_least_12_characters

  private

  def url_length_must_be_at_least_12_characters
    if url.length < 12
      errors.add(:url, "must be at least 12 characters long")
    end
  end
end
