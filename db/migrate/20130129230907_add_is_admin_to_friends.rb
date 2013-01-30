class AddIsAdminToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :is_admin, :boolean
  end
end
