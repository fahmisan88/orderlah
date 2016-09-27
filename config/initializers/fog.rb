if Rails.env.test? || Rails.env.development?

  CarrierWave.configure do |config|
    config.storage = :file
  end

else

  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV.fetch("AWS_ACCESS_KEY_ID"),
      aws_secret_access_key: ENV.fetch("AWS_SECRET_ACCESS_KEY"),
      region: 'ap-southeast-1',
    }
    config.fog_directory = ENV.fetch("AWS_BUCKET")
    config.fog_public = false
  end
end
