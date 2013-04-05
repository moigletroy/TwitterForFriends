class AddVideoToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :video_id, :integer
  end
end
