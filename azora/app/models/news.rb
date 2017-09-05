class News < ActiveRecord::Base
  mount_uploader :banner, NewsBannerUploader

  has_permalink :title, :update => true

  def self.latest_news
    News.order("updated_at DESC").limit(4)
  end
end
