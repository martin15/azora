class Continent < ActiveRecord::Base
  mount_uploader :banner, ContinentBannerUploader
  has_permalink :name, :update => true

  has_many :countries
  has_many :galleries

  scope :sorted, -> { order(:sequence) }

  def self.continent_list
    self.all.map{|c| ["#{c.name}", "#{c.id}"]}
  end

  def voa_list_by_country
    self.countries.where("visa_on_arrival = ?", true)
  end

  def free_visa_list_by_country
    self.countries.where("free_visa = ?", true)
  end

  def self.default
    self.all.order("sequence").first
  end
end
