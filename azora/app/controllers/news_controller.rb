class NewsController < ApplicationController
  def index
    @all_news = News.order("updated_at DESC").page(params[:page]).per(10)
  end

  def show
    @news = News.find_by_permalink(params[:permalink])
    if @news.nil?
      flash[:error] = "Cannot find the News !"
      redirect_to news_path
    end
  end
end
