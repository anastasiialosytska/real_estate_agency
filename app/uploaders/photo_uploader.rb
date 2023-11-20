# frozen_string_literal: true

class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  version :thumb do
    process resize_to_fit: [200, 200]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "/images/fallback/#{[version_name, 'default.png'].compact.join('_')}"
  end

  def extension_allowlist
    %w[jpg jpeg gif png]
  end
end
