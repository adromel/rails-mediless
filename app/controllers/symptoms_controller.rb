class SymptomsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @symptoms = Symptom.all
  end

  def show
    @symptom = Symptom.find(1)
    @oiltreatements = OilTreatment.where(symptom_id: @symptom.id)
    @acupointtreatments = AcupointTreatment.where(symptom_id: @symptom.id)
  end

end
