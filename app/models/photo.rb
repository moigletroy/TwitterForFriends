class Photo < ActiveRecord::Base
  attr_accessible :image, :title, :description, :friend, :friend_id, :remote_image_url

  mount_uploader :image, ImageUploader

  belongs_to :friend

  has_many :tweets

  after_commit :create_tweet

private
  def create_tweet
      tweet = Tweet.new
      tweet.friend = self.friend
      tweet.photo = self
      tweet.save
  end

end
