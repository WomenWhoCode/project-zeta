class UsersController < ApplicationController

  def new
	@user = User.new
  end

  def create
	@user = User.new(params[:user])
	if @user.save
	  flash[:success] = "Welcome to Hello Ruby Tuesdays!"
	  redirect_to @user
	else
	  render 'new'
	end
  end

  def show
#        flash[:success] = "Welcome to Hello Ruby Tuesdays!"
  	@user = User.find(params[:id])
  end

end
