class AcupointsController < ApplicationController
  before_action :authenticate_user!, only: [:save]

  def index
  end

  def show
    
  end

end
