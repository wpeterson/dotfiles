current_dir = File.dirname(__FILE__)
log_level                 :info
log_location              STDOUT
node_name                 "wpeterson"
cache_type                 'BasicFile'
cache_options( :path =>   "#{ENV['HOME']}/.chef/checksums" )
cookbook_path             ["/work/cookbooks/cookbooks"]
cookbook_copyright        "Brightcove, Inc."
cookbook_email            "wpeterson@brightcove.com"


## default values
knife[:flavor] = 'm1.large'
knife[:image] = 'ami-4fa37426' # oneiric ocelot us-east-1 64-bit instance-store
encrypted_data_bag_secret "/work/cookbooks/data_bags/data_bag_key"

# Hosted chef
# chef_server_url           "https://api.opscode.com/organizations/brightcove-appcloud"
# validation_client_name    "brightcove-appcloud-validator"
# validation_key            "#{current_dir}/brightcove-appcloud-validator.pem"
# client_key                "#{current_dir}/hosted-wpeterson.pem"

# Brightcove chef
chef_server_url           "http://chef.ops.brightcove.com:4000"
validation_client_name    "chef-validator"
validation_key            "#{current_dir}/central-chef-validator.pem"
client_key                "#{current_dir}/syseng-wpeterson.pem"

env = ENV['CHEF_ENV']
if env == "production" || env == 'katama_production'
  puts "INFO: using production environment"
  environment "production"
  knife[:aws_access_key_id] = ENV['AWS_PROD_ACCESS_KEY']
  knife[:aws_secret_access_key] = ENV['AWS_PROD_SECRET_KEY']
#  knife[:availability_zone] = 'us-east-1c'
  knife[:aws_ssh_key_id] = 'katama-prod'
  knife[:identity_file] = "/Users/wpeterson/.ec2/katama-prod.pem"
else # must be QA
  environment "qa"
  knife[:aws_access_key_id] = ENV['AWS_QA_ACCESS_KEY']
  knife[:aws_secret_access_key] = ENV['AWS_QA_SECRET_KEY']
#  knife[:availability_zone] = 'us-east-1c'
  knife[:aws_ssh_key_id] = 'katama_integration'
  knife[:identity_file] = "/Users/wpeterson/.ec2/katama-integration.pem"
end
