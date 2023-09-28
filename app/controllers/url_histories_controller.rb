class UrlHistoriesController < ApplicationController
  before_action :set_current_url, only: [:index]

  def index
    @url_histories = UrlHistory.all.order(created_at: :desc)
  end

  def create
    @url_history = UrlHistory.new(url_history_params)
    
    if @url_history.save
      flash[:success] = 'URL was successfully saved.'
      redirect_to url_histories_path
    else
      flash[:alert] = 'URL could not be saved.'
      redirect_to url_histories_path
    end
  end

  def email_report
    email = 'idealdips.0080@gmail.com' # how to get the user's email, do i give user login feature as well?
    urls = UrlHistory.all.pluck(:url)
  
    EmailReportWorker.perform_async(email, urls)
  end

  private

  def url_history_params
    params.require(:url_history).permit(:url)
  end

  def set_current_url
    @current_url = UrlHistory.find(params[:current_url]) if params[:current_url].present?

    @current_url = if params[:back]
      UrlHistory.where('created_at < ?', @current_url&.created_at || Time.current).order(created_at: :desc).first
    elsif params[:next]
      UrlHistory.where('created_at > ?', @current_url&.created_at || Time.current).order(created_at: :asc).first
    else
      UrlHistory.order(created_at: :desc).first
    end

    @disable_back_button = @current_url.nil? || UrlHistory.where('created_at < ?', @current_url.created_at).empty?
    @disable_next_button = @current_url.nil? || UrlHistory.where('created_at > ?', @current_url.created_at).empty?
  end
end
