if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else
  config.storage = :fog
end
