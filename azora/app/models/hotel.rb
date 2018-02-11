class Hotel < ActiveRecord::Base
  mount_uploader :logo, HotelLogoUploader
end
