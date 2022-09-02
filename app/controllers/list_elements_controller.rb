class ListElementsController < ApplicationController
  before_action :authenticate_user!

  # récupérer l'id de User
  # id Huile essentielle ou id Acupoint

  # récupérer l'id de listable_type
  # récupérer le list table de listable_id

  # récupérer les attributs pour type
  # récupérer le reste pour chaque type

  def index
    # @list_element = ListElement.all
  end

  def create
    # ListElement.new(listable: essential_oil)
    if params[:essential_oil_id].present?
      @essential_oil = EssentialOil.find(params[:essential_oil_id])
      @listable_essential_oil = ListElement.create(user: current_user, listable: @essential_oil)
      if @listable_essential_oil.save
        redirect_to essential_oil_path(@essential_oil), notice: "fonctionné"
      else
        redirect_to essential_oil_path(@essential_oil), notice: "pas marché"
      end
    elsif params[:acupoint_id].present?
      @acupoint = Acupoint.find(params[:acupoint_id])
      @listable_acupoint = ListElement.create(user: current_user, listable: @acupoint)
      redirect_to acupoint_path(@acupoint)
    end
  end
end
