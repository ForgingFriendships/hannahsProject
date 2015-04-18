class Event < ActiveRecord::Base
  attr_accessible :event_name, :description, :host, :start_date_time, :end_date_time, :venue, :address, :max_capacity
end
