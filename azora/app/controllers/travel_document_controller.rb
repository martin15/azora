class TravelDocumentController < ApplicationController

  def visa
    @meta_description = "Persyaratan Visa, Dokumen Perjalanan, Negara Bebas Visa, Visa on Arrival"
    @continents = Continent.includes([:countries])
    if params[:permalink] == Country::PERSYARATAN_VISA ||
       params[:permalink] == Country::VISA_TIDAK_DAPAT_DIPROSES

      render 'visa_detail_thumb'
    elsif params[:permalink] == Country::NEGARA_BEBAS_VISA ||
          params[:permalink] == Country::VISA_ON_ARRIVAL

      @header = params[:permalink] == Country::VISA_ON_ARRIVAL ? "voa" : "free_visa"
      render 'visa_detail_list'
    end
    @continents = Continent.sorted
  end

  def passport
    @passport = SystemSetting.find_by_permalink('passport')
  end

  def visa_detail
    @continents = Continent.sorted
    @country = Country.find_by_permalink(params[:permalink])
    @continent = @country.continent
  end
end
