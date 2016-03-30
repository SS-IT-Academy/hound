Split.configure do |config|
  config.experiments = YAML.load_file "config/experiments.yml"
end
puts "!"*100 + " Started"
puts "ENV.fetch(\"REDIS_URL\", #{ENV.fetch("REDIS_URL")}): "

require 'uri'
puts "URI: #{URI(ENV.fetch("REDIS_URL"))}"

puts "Finished!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1111"
Split.redis = ENV.fetch("REDIS_URL")

Split::Dashboard.use Rack::Auth::Basic do |username, password|
  username == "admin" && password == ENV.fetch("SPLIT_ADMIN_PASSWORD")
end
