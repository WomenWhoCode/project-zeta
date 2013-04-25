class LinksController < ApplicationController
 
  def index
    @links = Link.all
  end
 
  def show
    @links = current_user.links
  end
  
  def new
    @link = Link.new
  end
  
  def create
    @link = Link.new(params[:link])
    @link.user = current_user
    if @link.save
      redirect_to links_path
    else
      render 'new'
    end
  end
  
  def edit
    @link = Link.find(params[:id])
  end
  
  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(params[:link])
      redirect_to links_path
    else
      render :edit
    end
  end
  
  def destroy
      Link.find(params[:id]).destroy
      redirect_to links_path
    end

end
