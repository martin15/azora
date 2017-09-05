class Gallery < ActiveRecord::Base
  mount_uploader :image, GalleryUploader

  belongs_to :continent
  belongs_to :country
end
