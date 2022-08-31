class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @symptoms = Symptom.all
  end

  def test
    
  end
end
