class Photo < ActiveRecord::Base
  attr_accessible :image, :title, :description, :friend, :friend_id, :remote_image_url

  mount_uploader :image, ImageUploader

  belongs_to :friend

  has_many :tweets

end
