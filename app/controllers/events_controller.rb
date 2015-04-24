class EventsController < ApplicationController
  # All the pages these controllers manage are generally for admins only,
  # so we leave the filter checking if this person is an admin before loading
  # this controller and view, but we don't need to check if someone is signed
  # in.  Obviously if their @current_user status validates as an "admin" they
  # must be signed in to have been authenticated.  One exception, the
  # 'all' page is visible to anyone, even if not signed in, so it skips
  # all filters
  skip_before_filter :block_page_if_not_signed_in
  skip_before_filter :block_page_if_not_admin, :only => [:all]

  def show
    ##
    ##
    ## What is this method needed/used for? -Greg
    ##
    id = params[:id] # retrieve movie ID from URI route
    @event = Event.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @events = Event.find(:all, :order => :start_date_time)
  end

  def all
    @events = Event.find(:all, :order => :start_date_time)
  end

  def new
    # default: render 'new' template
  end

  def create
    @event = Event.create!(params[:event])
    flash[:notice] = "#{@event.event_name} was successfully created."
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes!(params[:event])
    flash[:notice] = "#{@event.event_name} was successfully updated."
    redirect_to events_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Event '#{@event.event_path}' deleted."
    redirect_to events_path
  end

end
