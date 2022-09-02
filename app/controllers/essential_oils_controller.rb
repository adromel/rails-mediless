class EssentialOilsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @essential_oil = EssentialOil.find(params[:id])
    @list_element = ListElement.find_by(listable: @essential_oil, user: current_user)
  end

end
