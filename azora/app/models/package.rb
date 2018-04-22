class Package < ActiveRecord::Base
  mount_uploader :banner, PackageBannerUploader
  has_permalink :title, :update => true

  def self.default
    self.first
  end

  def self.get_by_type(type='domestic')
    self.where("package_type = '#{type}'")
  end
end
