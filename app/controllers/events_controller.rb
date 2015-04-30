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
    @events.each do |event|
      if !(event.event_picture_file_path)
        event.update_attribute(:event_picture_file_path, "/img/events/volunteers-hands.jpg")
      end
    end
  end


  def new
    # default: render 'new' template
  end



  def create
    @event_creation_params = params[:event]

    # Ensure there is a maximum capacity on people who may attend event...
    # if no max was given or if an invalid value given (since on the form to
    # make new events, max capacity is a text/string box), then set max
    # capacity to zero.... all of this handled correctly by ruby method "to_i"
    @event_creation_params[:max_capacity] = @event_creation_params[:max_capacity].to_i

    # Ensure you don't start a new event with "nil" people attending (this
    # causes errors down the line, nor with a negative number of people
    # attending event (if number attending is negative when event is created
    # it would allow more people to register for event than the max_capacity)..
    if (@event_creation_params[:num_persons_attending] == nil) || (@event_creation_params[:num_person_attending] < 0)
      @event_creation_params[:num_persons_attending] = 0
    end

    @event = Event.create!(@event_creation_params)
    flash[:notice] = @temp
    #flash[:notice] = "#{@event.event_name} was successfully created."
    redirect_to events_path
  end






  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes!(params[:event])
    flash[:notice] = "#{@event.event_name} was successfully updated."
    redirect_to events_path(@event) and return
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Event '#{@event.event_name}' deleted."
    redirect_to events_path
  end

end
