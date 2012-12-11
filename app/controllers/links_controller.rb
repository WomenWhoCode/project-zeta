class LinksController < ApplicationController
  
  def new
    @link = Link.new
    @obj = @link
  end
  
  def create
    @link = Link.new(params[:link])
    @obj = @link
    if @link.save
      redirect_to links_path
    else
      render 'new'
    end
  end
  
  def index
    @links = Link.all
  end
  
end
