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

require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
