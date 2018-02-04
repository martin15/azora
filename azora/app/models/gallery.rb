class Gallery < ActiveRecord::Base
  mount_uploader :image, GalleryUploader

  belongs_to :continent
  belongs_to :country

  def file_type
    self.image.content_type.to_s.downcase.split('/').first.to_s.gsub(' ','_')
  end

  def video_thumb
    path = self.image.url.split("/")
    path = (path.reverse.drop(1).reverse).join("/")
    file = File.basename("#{self.image.url}", ".*")
    "#{path}/vid_thumb_#{file}.png"
  end
end
