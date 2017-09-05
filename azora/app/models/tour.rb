class Tour < ActiveRecord::Base
  has_permalink :name, :update => true

  has_many :tour_images, :dependent => :destroy
  has_many :tour_itineraries, :dependent => :destroy

  belongs_to :country

end
