class EventsController < ApplicationController
 
  def index
    @events = Event.all
  end
 
  def show
    @events = current_user.events
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end
  
  def destroy
      Event.find(params[:id]).destroy
      redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :duration, :location, :tag_list)
  end

end
