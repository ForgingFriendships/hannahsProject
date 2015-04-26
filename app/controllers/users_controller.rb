class UsersController < ApplicationController
  # Creation of new Users is handled by Sessions controller.  When a new session
  # is created with a User unheard of before (first time you sign in), the
  # sessions controller makes a new User instance

  # The plan now is that page views that are handled through *this* User
  # controller (or one of its methods rather) should be pages that are private
  # and only visible to someone who is signed in.  Either these pages have no
  # meaning if no one is signed in (like, the page that lists the events you
  # have registered for, would have no meaning if no one is signed in), or they
  # are some other kind of page you should only see if you are signed in.
  # So we needn't check if you are an adminstrator... skip that check..
  skip_before_filter :block_page_if_not_admin
  # Leave in place before_filters that check if you are signed in



  def my_events
    # the events this user is registered to attend; sorted by date...
    @events = @current_user.events.find(:all, :order => :start_date_time)
  end

  def register_for_event
    @event_for_registration = Event.where(:id => params[:event_for_registration]).first

    # IF EVENT IS FULL TO CAPACITY, DO NOT ALLOW USER TO REGISTER/ATTEND...
    if @event_for_registration.num_persons_attending >= @event_for_registration.max_capacity
      flash[:notice] = "Sorry! That event is full.  Cannot register to attend."
      redirect_to '/my_events' and return
    end



    if @current_user.events.exists?(@event_for_registration)
      # user already registered for this event before, so do nothing...
      redirect_to '/my_events' and return
    end

    # Add the event (given as a param to this controller method) to the list
    # of events for this user / at same time this will add this user to list
    # of attendees for that event...
    @current_user.events << @event_for_registration

    # Tell the event to increment the number of people attending by 1...
    @event_for_registration.update_attribute(:num_persons_attending,  @event_for_registration.num_persons_attending + 1)

      flash[:notice] = "You are now registered to attend this event! See list below."
      redirect_to '/my_events' and return
  end




end
