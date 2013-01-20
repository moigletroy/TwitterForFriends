class Tweet < ActiveRecord::Base
  belongs_to :friend
  attr_accessible :message, :friend_id
end
