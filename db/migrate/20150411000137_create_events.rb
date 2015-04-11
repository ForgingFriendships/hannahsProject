class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string   :event_name
      t.text  	 :description
      t.string   :host
      #:null => false == cannot give a null value
      t.datetime :start_date_time, :null => false
      t.datetime :end_date_time, :null => false
      t.string   :venue
      t.text     :address
      t.integer  :num_persons_attending
      t.integer  :max_capacity
      t.timestamps
    end
  end
  
  def drop_events
    drop_table :events
  end

end
