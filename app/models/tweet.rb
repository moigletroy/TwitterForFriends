# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  message    :string
#  friend_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  photo_id   :integer
#  video_id   :integer
#

class Tweet < ActiveRecord::Base
  belongs_to :friend

  belongs_to :photo
  belongs_to :video
  
  # attr_accessible :message, :friend_id, :photo_id

end
