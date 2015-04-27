class AddPictureAttributeToEvents < ActiveRecord::Migration
  def up
    change_table :events do |t|
      t.string :event_picture_file_path
    end
  end

  def down
    remove_column :events, :event_picture_file_path
  end
end
