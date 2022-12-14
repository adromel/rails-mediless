class SymptomsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_symptom, only: %i[show acupoints]

  def index
    @symptoms = Symptom.all
  end

  def show
    @oiltreatements = OilTreatment.where(symptom_id: @symptom.id)
    @acupointtreatments = AcupointTreatment.where(symptom_id: @symptom.id)
  end

  def acupoints
    @acupoints = @symptom.acupoints
    @list_element = ListElement.find_by(listable: @acupoint, user: current_user)
  end

  def search
    @symptoms = Symptom.where("unaccent(name) ILIKE ?", "%#{params[:query]}%")

    if params[:query].present? && @symptoms.exists?
      render "search", layout: false
    else
      render plain: ''
    end
  end

  private

  def set_symptom
    @symptom = Symptom.find(params[:id])
  end
end
