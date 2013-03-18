# encoding: utf-8

class ImageUploader < BaseUploader

  version :medium do
    process :resize_to_limit => [400,400]
  end

  version :large do
    process :resize_to_limit => [800,800]
  end

end
