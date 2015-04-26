class Event < ActiveRecord::Base
  attr_accessible :event_name, :description, :host, :start_date_time, :end_date_time, :venue, :address, :max_capacity, :event_picture_file_path, :num_persons_attending

  has_and_belongs_to_many :users
end
