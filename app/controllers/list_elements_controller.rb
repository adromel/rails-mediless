class ListElementsController < ApplicationController
  before_action :authenticate_user!

  # récupérer l'id de User
  # id Huile essentielle ou id Acupoint

  # récupérer l'id de listable_type
  # récupérer le list table de listable_id

  # récupérer les attributs pour type
  # récupérer le reste pour chaque type

  def show
    @list_element = ListElement.find_by(listable: @essential_oil, user: current_user)
    @essential_oil = EssentialOil.find(params[:id])
  end

  def index
    @list_elements = current_user.list_elements
  end

  def create
    # ListElement.new(listable: essential_oil)
    if params[:essential_oil_id].present?
      @essential_oil = EssentialOil.find(params[:essential_oil_id])
      @listable_essential_oil = ListElement.create(user: current_user, listable: @essential_oil)
      if @listable_essential_oil.save
        redirect_to @essential_oil, notice: "élement sauvegardé"
      else
        redirect_to essential_oil_path(@essential_oil), notice: "Sauvegarder échouée"
      end
    elsif params[:acupoint_id].present?
      @acupoint = Acupoint.find(params[:acupoint_id])
      @listable_acupoint = ListElement.create(user: current_user, listable: @acupoint)
      redirect_to acupoint_path(@acupoint)
    end
  end

  # récupérer le list element
  # s'il en a un alors supprimer
  # pas besoin de récupérer l'id card déjà associé à id

  def destroy
    @list_element = ListElement.find(params[:id])
    @list_element.destroy
    redirect_to @list_element.listable, notice: "élément non sauvegardé"
  end

end
