class SpecialistsController < ApplicationController

  def index
    @specialists = Specialist.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @specialists.geocoded.map do |specialist|
      {
        lat: specialist.latitude,
        lng: specialist.longitude
      }
    end

  end

end
