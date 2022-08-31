class SymptomsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @symptoms = Symptom.all
  end

  def show
    @symptom = Symptom.find(params[:id])
    @essential_oils = Essentiel_oil.where(symptom_id: @symptom.id)
  end

end
