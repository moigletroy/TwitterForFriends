# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  title       :string
#  image       :string
#  description :string
#  friend_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Photo < ActiveRecord::Base
  #attr_accessible :image, :title, :description, :friend, :friend_id, :remote_image_url

  mount_uploader :image, ImageUploader

  belongs_to :friend

  has_many :tweets

  after_create :create_tweet

  def self.recent_photos
    Photo.order("created_at desc").limit(8)
  end

private
  def create_tweet
      tweet = Tweet.new
      tweet.friend = self.friend
      tweet.photo = self
      tweet.save
  end

end
