class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  storage :file 
  process resize_to_fill: [300, 200]

  def store_dir
    "public/uploads/"
  end

  version :thumb do
    process resize_to_fill: [70, 50]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
