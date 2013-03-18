class Tweet < ActiveRecord::Base
  belongs_to :friend

  belongs_to :photo

  attr_accessible :message, :friend_id, :photo_id

end
