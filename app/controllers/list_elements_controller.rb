class ListsController < ApplicationController
  before_action :authenticate_user!

  # def index
  #   @list_elements = List.all
  # end

  # def create
  #   @listable_id = current_user.list_elements.create!(remedy_params)
  #   redirect_to user_lists_elements_path(current_user)
  # end

  # private

  # def set_essential_oils
  #   @listtable_id = List.find(params[:id])
  # end

  # def remedy_params
  #   params.require(:essential_oil, :acupoint).permit(:name)
  # end
end
