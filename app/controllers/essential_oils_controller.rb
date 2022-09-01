class EssentialOilsController < ApplicationController
  before_action :authenticate_user!, only: [:save]

  def show
    @essential_oil = EssentialOil.find(params[:id])
  end

  def save
  end

end
