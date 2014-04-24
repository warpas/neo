ActiveAdmin::Editor.configure do |config|
  config.parser_rules['tags']['div'] = {
    'remove' => 1
  }
  # config.s3_bucket = ''
  # config.aws_access_key_id = ''
  # config.aws_access_secret = ''
  # config.storage_dir = 'uploads'
end
