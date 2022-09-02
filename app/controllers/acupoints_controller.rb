class AcupointsController < ApplicationController
  before_action :authenticate_user!, only: [:save]

<<<<<<< HEAD:app/controllers/acu_points_controller.rb
  def show

=======
  def index
>>>>>>> master:app/controllers/acupoints_controller.rb
  end

  def show
    
  end

end
