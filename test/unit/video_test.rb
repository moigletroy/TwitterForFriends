# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  title      :string
#  image      :string
#  data_url   :string
#  source     :string
#  source_id  :string
#  friend_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
