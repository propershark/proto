require_relative '../helpers/fa_helper.rb'
require_relative '../helpers/rpc_helper.rb'

get '/' do
  @rpcs = Dir['data/rpcs/*.yaml'].map{ |f| YAML.load_file(f) }

  haml :index
end
