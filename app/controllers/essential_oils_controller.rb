class EssentialOilsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @essential_oil = EssentialOil.find(params[:id])
  end

end
