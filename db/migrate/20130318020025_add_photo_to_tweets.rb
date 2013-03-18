class AddPhotoToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :photo_id, :integer
  end
end
