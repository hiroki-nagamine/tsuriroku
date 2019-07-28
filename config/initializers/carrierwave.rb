require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    # config.storage :fog
    config.fog_provider = 'fog-aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
      region: ENV['S3_REGION']
    }
    config.fog_directory = ENV['S3_BUCKET']
    config.cache_storage = :fog
    config.asset_host = "https://s3.ap-northeast-1.amazonaws.com/tsuriroku-photo"
    config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}"}#画像のキャッシュ数 365日に設定
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/