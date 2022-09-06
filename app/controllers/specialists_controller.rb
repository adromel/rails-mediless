class SpecialistsController < ApplicationController

  def index
    @specialists = Specialist.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @specialists.geocoded.map do |specialist|
      if specialist.speciality == "acupuncteur"
        {
          lat: specialist.latitude,
          lng: specialist.longitude,
          info_window: render_to_string(partial: "info_window", locals: {specialist: specialist}),
          image_url: helpers.asset_url("acupuncteur.png")
        }
      else
        {
          lat: specialist.latitude,
          lng: specialist.longitude,
          info_window: render_to_string(partial: "info_window", locals: {specialist: specialist}),
          image_url: helpers.asset_url("shop.png")
        }
      end

    end
  end

end
