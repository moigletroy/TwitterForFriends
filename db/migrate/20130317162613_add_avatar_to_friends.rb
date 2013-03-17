class AddAvatarToFriends < ActiveRecord::Migration
  def change 
  	# Please work on Heroku
    add_column :friends, :avatar, :string 
  end
end
