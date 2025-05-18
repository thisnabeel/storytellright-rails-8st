AWS_CONFIG = {
  'access_key_id' => ENV['AWS_ACCESS_KEY_ID'],
  'secret_access_key' => ENV['AWS_SECRET_ACCESS_KEY'],
  'region' => 'us-east-1',
  'bucket' => 'storytellright',
  'acl' => 'public-read',
  'key_start' => 'uploads/'
}

Aws.config.update({
   credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
})

S3_BUCKET = Aws::S3::Resource.new.bucket('storytellright')