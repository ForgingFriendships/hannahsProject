class EventsController < ApplicationController
  skip_before_filter :block_page_if_not_signed_in

  def show
    id = params[:id] # retrieve movie ID from URI route
    @event = Event.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
  	@events = Event.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @event = Event.create!(params[:event])
    flash[:notice] = "#{@event.event_name} was successfully created."
    redirect_to event_path
  end

  def edit
    @event = Event.find params[:id]
  end

  def update
    @event = Event.find params[:id]
    @event.update_attributes!(params[:event])
    flash[:notice] = "#{@movie.event_name} was successfully updated."
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Movie '#{@movie.event_path}' deleted."
    redirect_to event_path
  end

end