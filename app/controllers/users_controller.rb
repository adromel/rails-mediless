class UsersController < ApplicationController
  after_create :add_list

  def add_list
    List.create(user: current_user)
  end
end
