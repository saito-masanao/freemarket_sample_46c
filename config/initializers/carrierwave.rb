require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  SECRETS_CONFIG = YAML.load_file("#{Rails.root}/config/secrets.yml")[Rails.env].symbolize_keys!
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: SECRETS_CONFIG[:aws_access_key_id],
    # Rails.application.secrets.aws_access_key_id,
    aws_secret_access_key: SECRETS_CONFIG[:aws_secret_access_key],
    # Rails.application.secrets.aws_secret_access_key,
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'freemarketsample46c'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/freemarketsample46c'
end
