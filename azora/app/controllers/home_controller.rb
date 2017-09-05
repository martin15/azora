class HomeController < ApplicationController

  def index
    @latest_news = News.latest_news
    @banners = Banner.order("sequence")
  end
end
