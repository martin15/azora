class Country < ActiveRecord::Base
  VISA_MENU = {
    :persyaratan_visa => "Persyaratan Visa",
    :negara_bebas_visa => "Negara Bebas Visa",
    :visa_on_arrival => "Visa On Arrival",
    :visa_tidak_dapat_diproses => "Visa Tidak Dapat Diproses"
  }

  PERSYARATAN_VISA          = "persyaratan_visa"
  NEGARA_BEBAS_VISA         = "negara_bebas_visa"
  VISA_ON_ARRIVAL           = "visa_on_arrival"
  VISA_TIDAK_DAPAT_DIPROSES = "visa_tidak_dapat_diproses"

  mount_uploader :banner, CountryBannerUploader
  has_permalink :name, :update => true

  has_many :galleries
  has_many :tours

  belongs_to :continent

  validates :name, :presence => true
  #validates :banner, :presence => true
  #validates :visa_requirement, :presence => true

  def self.country_list
    self.order("name").map { |c| [c.name, c.id] }
  end

  def self.default
    self.find_by_name("United Kingdom") || self.first
  end
end
