class News < ActiveRecord::Base
  mount_uploader :banner, NewsBannerUploader

  has_permalink :title, :update => true
end
