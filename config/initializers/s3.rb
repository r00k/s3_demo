# On boot, establish a connection to S3.
#
# Credentials are read from ~/.s3_keys.yml
#
# That file should look like this:
# access_key_id: xxxxxxxxxx
# secret_access_key: xxxxxxxxx
#
s3_config_file = File.expand_path("~/.s3_keys.yml")

if File.exists?(s3_config_file)
  config = YAML::load(File.read(s3_config_file))
  AWS::S3::Base.establish_connection!(
    :access_key_id     => config['access_key_id'],
    :secret_access_key => config['secret_access_key']
  )
else
  raise LoadError, 
    "Expected to find file #{s3_config_file} with your S3 keys.  See config/initialzers/s3.rb for details."
end
