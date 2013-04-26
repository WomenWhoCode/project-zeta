class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  
  def links_index
    @links = current_user.links
  end

end
