class Event < ActiveRecord::Base
  attr_accessible :event_name, :description, :host, :start_date_time, :end_date_time, :venue, :address
  attr_protected :num_persons_attending, :max_capacity
end
