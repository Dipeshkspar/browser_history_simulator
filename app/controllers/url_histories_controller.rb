class UrlHistoriesController < ApplicationController
  def index
    @url_histories = UrlHistory.all.order(created_at: :desc)
  end

  def create
    @url_history = UrlHistory.new(url_history_params)
    
    if @url_history.save
      redirect_to url_histories_path, notice: 'URL was successfully saved.'
    else
      flash[:alert] = 'URL could not be saved.'
      redirect_to url_histories_path
    end
  end

  private

  def url_history_params
    params.require(:url_history).permit(:url)
  end
end
