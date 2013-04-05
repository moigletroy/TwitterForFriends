class Video < ActiveRecord::Base
  attr_accessible :data_url, :description, :image, :title

  after_commit :create_tweet

  belongs_to :friend

  has_many :tweets

  def self.recent_videos
    Video.order("created_at desc").limit(8)
  end

  def self.from_url(url)

      # Use Linkser for YouTube and Vimeo
      y = Linkser.parse url
      v = Video.new
      source = y.ogp.site_name 
      if url.index "vimeo.com"
        source_id = (url.match /.*vimeo.com\/(.*)/)[1]
      elsif url.index "youtube.com"
        source_id = (url.match /.*youtube.com\/watch\?v=(.*)/)[1]
      elsif url.index "collegehumor.com"
        source_id = (url.match /.*collegehumor.com\/video\/(.*)\/.*/)[1]
      elsif url.index "funnyordie.com"
        source = "FunnyOrDie"
        source_id = (url.match /.funnyordie.com\/videos\/(.*)\/.*/)[1]
      end
      existing = Video.find_by_source_and_source_id(source, source_id)
      if existing 
        v = existing
      else
        v.source = source
        v.source_id = source_id
        v.title = y.title
        v.image = y.images.first.url rescue nil
        v.image ||= "https://i1.ytimg.com/vi/#{source_id}/default.jpg"
        v.data_url = y.resource.url rescue ""
        v.save
      end
      v
  end


private
  def create_tweet
      tweet = Tweet.new
      tweet.friend = self.friend
      tweet.video = self
      tweet.save
  end


end
