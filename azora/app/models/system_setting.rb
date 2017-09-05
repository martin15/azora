class SystemSetting < ActiveRecord::Base
  has_permalink :name, :update => true

  has_many    :child_system_settings, :class_name => "SystemSetting", :foreign_key => "parent_id"

  belongs_to  :parent_system_setting, :class_name => "SystemSetting", :foreign_key => "parent_id"

  validates :name, :presence => true

  scope :parent_system_settings, -> {where("parent_id IS NULL")}

  def is_parent?
    self.parent_id.nil?
  end
end
