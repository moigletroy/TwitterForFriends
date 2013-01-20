class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :message
      t.references :friend

      t.timestamps
    end
    add_index :tweets, :friend_id
  end
end
