class TourImage < ActiveRecord::Base
  mount_uploader :image, TourImageUploader

  belongs_to :tour
end
