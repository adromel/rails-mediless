class SymptomsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_symptom, only: %i[ show acupoints ]

  def index
    @symptoms = Symptom.all
  end

  def show
    @oiltreatements = OilTreatment.where(symptom_id: @symptom.id)
    @acupointtreatments = AcupointTreatment.where(symptom_id: @symptom.id)
  end

  def acupoints
    @acupoints = @symptom.acupoints
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
