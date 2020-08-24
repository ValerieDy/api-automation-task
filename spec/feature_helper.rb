require 'require_all'
require 'ffaker'
require 'client-api'
Dir.glob(File.join(File.dirname(__FILE__), 'api', '*.rb')).each{|file| require file}

ClientApi.configure do |config|
  config.base_url = 'https://reqres.in'
  config.headers = {'Content-Type' => 'appliation/json', 'Accept' => 'application/json'}
end

