class Tweet < ActiveRecord::Base
  belongs_to :friend

  belongs_to :photo
  belongs_to :video
  
  attr_accessible :message, :friend_id, :photo_id

end
