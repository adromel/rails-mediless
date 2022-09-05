class SpecialistsController < ApplicationController

  def index
    @specialists = Specialist.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @specialists.geocoded.map do |specialist|
      {
        lat: specialist.latitude,
        lng: specialist.longitude,
        info_window: render_to_string(partial: "info_window", locals: {specialist: specialist})
      }
    end
  end

end