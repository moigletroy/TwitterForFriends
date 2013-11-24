# In irb:  load './lib/tff_instagram.rb'
#
#
require "instagram"

# All methods require authentication (either by client ID or access token).
# To get your Instagram OAuth credentials, register an app at http://instagr.am/oauth/client/register/
Instagram.configure do |config|
  config.client_id = "0d19bd9e308f49279af3d3cc41d37d7f"
  #SECRET = "4212603c02724a18b02237a0ca6c3807"
  #config.access_token = YOUR_ACCESS_TOKEN
end

# finds the popular stuff
# x=Instagram.media_popular

# prints the url of each image
# x.each {|y| puts y.images.standard_resolution.url};nil

# gives you  the profile pictue  of each user
# x.each {|y| puts y.images.standard_resolution.url};nil

# shows the full name of the user
# x.each {|y| puts y.images.standard_resolution.url};nil

class TffInstagram
	def self.popular
		x=Instagram.media_popular
		# Normalize Instagram results to only include what we want
		x.map do |y| 
			{
				profile_pic: y.user.profile_picture, 
				username: y.user.full_name, 
				caption: (y.caption.text rescue "--no caption--"),
				image_url: y.images.standard_resolution.url
			}
		end
	end
end