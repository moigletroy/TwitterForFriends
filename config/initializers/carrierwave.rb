  # Access Key ID:
  # AKIAIN4K3AAZRCN2IVIQ
  # Secret Access Key:
  # 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

# config/initializers/carrierwave.rb
CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = 'carrierwave' # ...two lines

  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAIN4K3AAZRCN2IVIQ' || ENV['AWS_ACCESS_KEY_ID'],       # required
    :aws_secret_access_key  => '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' || ENV['AWS_SECRET_ACCESS_KEY'],                    # required
    :region                 => 'us-east-1'                  # optional, defaults to 'us-east-1'
    #:host                   => 's3.example.com',             # optional, defaults to nil
    #:endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'twitterforfriends'                             # required
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end

Excon.defaults[:ssl_verify_peer] = false
