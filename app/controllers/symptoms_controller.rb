class SymptomsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_symptom, only: %i[ show ]

  def index
    @symptoms = Symptom.all
  end

  def show
    @oiltreatements = OilTreatment.where(symptom_id: @symptom.id)
    @acupointtreatments = AcupointTreatment.where(symptom_id: @symptom.id)
  end

  def search
    @symptoms = Symptom.where("name ILIKE ?", "%#{params[:query]}%")

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
