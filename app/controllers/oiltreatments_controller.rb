class OiltreatmentsController < ApplicationController

  # before_action :set_essential_oil, only: %i[show]
  def index

  end

  def show
    # @symptom_id = Symptom.find(1)
    @oiltreatements = OilTreatment.where(symptom_id: 2)
  end

  private

  # def set_essential_oil
  #   @essential_oil = EssentialOil.find(params[:id])
  # end

  # def set_symptom
  #   @symptom = Symptom.find(params[:id])
  # end
end
