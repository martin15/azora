class Gallery < ActiveRecord::Base
  mount_uploader :image, GalleryUploader

  belongs_to :continent
  belongs_to :country

  def file_type
    self.image.content_type.to_s.downcase.split('/').first.to_s.gsub(' ','_')
  end
end
