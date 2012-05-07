# Ruby script to help with spinning up instances with Hosted Chef
# example:
# ruby spin_up.rb -e qa -r rails_server -n scott -z us-east-1a
# becomes
# CHEF_ENV=qa knife ec2 server create -V -E qa -x ubuntu -i ~/.ec2/katama-integration.pem -r "role[hudson] role[rails_server]" -N scott.hud -Z us-east-1a -G default

require 'optparse'

options = {:sg => "default"}

optparse = OptionParser.new do |opts|
  opts.banner = "Usage: spin_up.rb [options]"
  
  opts.on('-e', '--env <qa|staging|production>', 'which env to use') do |env|
    options[:env] = env
    if env == "qa" || env == "staging"
      options[:keyfile] = "~/.ec2/katama-integration.pem"
    elsif env == "production"
      options[:keyfile] = "~/.ec2/katama-prod.pem" 
    end
  end
  
  opts.on('-r', '--roles <comma separated list of role names>', 'roles to be applied') do |roles|
    roles_string = roles.split(",")
    roles_string.unshift "hudson" if options[:env] == "qa"
    roles_string.unshift "davis" if options[:env] == "production"
    options[:roles] = roles_string.map {|role| "role[#{role}]"}.join(" ")
  end
  
  opts.on('-c', '--recipes <comma separated list of recipe names>', 'recipes to be applied') do |recipes|
    recipes_string = recipes.split(",")
    options[:roles] = options[:roles] + " " + recipes_string.map {|recipe| "recipe[#{recipe}]"}.join(" ")
  end

  opts.on('-n', '--name <instance name>', 'node name') do |name|
    options[:name] = name + ".hud" if options[:env] == "qa"
    options[:name] = name + ".dav" if options[:env] == "production"    
  end

  opts.on('-z', '--zone <availability zone>', 'availability zone') do |az|
    options[:az] = az
  end

  opts.on('-s', '--security <security group>', 'security group (ueses default if not specified)') do |sg|
    options[:sg] = sg
  end
end

begin                                                                                                                                                                                                             
  optparse.parse!                                                                                                                                                                                                 
  mandatory = [:env, :roles, :name, :az]                                                                                                                                                            
  missing = mandatory.select{ |param| options[param].nil? }                                                                                                            
  if not missing.empty?                                                                                                                                              
    puts "Missing options: #{missing.join(', ')}"                                                                                                                    
    puts optparse                                                                                                                                                    
    exit                                                                                                                                                             
  end                                                                                                                                                               
rescue OptionParser::InvalidOption, OptionParser::MissingArgument                                                                                                           
  puts $!.to_s                                                    
  puts optparse                                                   
  exit                                                            
end

puts "CHEF_ENV=#{options[:env]} knife ec2 server create -V -E #{options[:env]} -x ubuntu -i #{options[:keyfile]} -r \"#{options[:roles]}\" -N #{options[:name]} -Z #{options[:az]} -G #{options[:sg]}"