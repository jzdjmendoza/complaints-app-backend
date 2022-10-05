module Public
  class LocationsController < ApiController
    skip_before_action :authenticate_user
  
    def regions
      render json: ::Pilipinas::Region.all
    end

    def provinces
      region = ::Pilipinas::Region.find_by_name(params[:name])
      render json: region&.provinces || ::Pilipinas::Province.all
    end

    def cities
      district = ::Pilipinas::Province.find_by_name(params[:name]) 
      render json: district&.cities || ::Pilipinas::City.all
    end

    def barangays
      city = ::Pilipinas::City.find_by_name(params[:name])
      render json: city&.barangays || ::Pilipinas::Barangay.all
    end
  end
end