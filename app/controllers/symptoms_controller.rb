class SymptomsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_essential_oil, only: %i[show]

  def index
    @symptoms = Symptom.all
  end

  def show
    @oiltreatements = OilTreatment.where(symptom_id: 6)
  end

  private

  def set_essential_oil
    @essential_oil = EssentialOil.find(params[:id])
  end
end
