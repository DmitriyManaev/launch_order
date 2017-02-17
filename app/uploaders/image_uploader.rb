class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  storage :file 
  process resize_to_fill: [300, 200]

  def store_dir
    "uploads/"
  end

  def default_url(*args)
    "not_available.png"
  end

  version :thumb do
    process resize_to_fill: [180, 180]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
