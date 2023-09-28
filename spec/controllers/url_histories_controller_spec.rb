require 'rails_helper'

RSpec.describe UrlHistoriesController, type: :controller do
  describe 'POST #create' do
    let(:url_history) { FactoryGirl.attributes_for(:url_history) }

    it 'creates a new UrlHistory' do
      post :create, params: { url_history: url_history }
      expect(UrlHistory.count).to eq(1)
    end

    it 'redirects to the index page' do
      post :create, params: { url_history: { url: url_history } }
      expect(response).to redirect_to(url_histories_path)
    end

    it 'displays a success flash message' do
      post :create, params: { url_history: { url: url_history } }
      expect(flash[:success]).to eq('URL was successfully saved.')
    end
  end
end