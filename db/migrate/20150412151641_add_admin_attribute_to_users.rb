class AddAdminAttributeToUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.boolean :admin, :default => false
      t.string :email
    end
  end

  def down
    remove_column :users, :admin
    remove_column :users, :email
  end
end
