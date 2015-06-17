CarrierWave.configure do |config|

  if Rails.env.test? || Rails.env.cucumber?
    CarrierWave.configure do |config|
      config.storage = :file
      config.enable_processing = false
    end
  end


  if ENV['HEROKU-STAGING'].present?
    config.fog_credentials = {
      :provider               => 'XXX',
      :aws_access_key_id      => 'XXX',
      :aws_secret_access_key  => 'XXX',
      :region                 => 'ap-southeast-2'
    }
    config.fog_directory  = 'hop-n-sail-develop'
    # config.fog_public     = false                                   # optional, defaults to true
    # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}

    config.cache_dir = "#{Rails.root}/tmp/uploads"
  end
  #config.root = Rails.root
end