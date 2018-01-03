class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :amin, :boolean, default: false
  end
end
