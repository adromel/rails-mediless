class UsersController < ApplicationController
  before_action :authenticate_user!
  after_create :add_list

  def add_list
    List.create(user: current_user)
  end
end
