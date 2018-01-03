class ChangeAminToUsersToAdmin < ActiveRecord::Migration
  def change
    rename_column :users, :amin, :admin
  end
end
