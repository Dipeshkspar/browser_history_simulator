class UrlHistoriesController < ApplicationController
  before_action :set_current_url, only: [:index]
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

  def email_report
    email = 'abc@gmail.com' # how to get the user's email, do i give user login feature as well?
    urls = UrlHistory.all.pluck(:url)
  
    EmailReportWorker.perform_async(email, urls)
  
    redirect_to url_histories_path, notice: 'Email report is being generated and will be sent shortly.'
  end

  private

  def url_history_params
    params.require(:url_history).permit(:url)
  end

  def set_current_url
    @current_url = if params[:back]
      UrlHistory.where('created_at < ?', @current_url&.created_at || Time.current).order(created_at: :desc).first
    elsif params[:next]
      UrlHistory.where('created_at > ?', @current_url&.created_at || Time.current).order(created_at: :asc).first
    else
      UrlHistory.new
    end
  end
end
