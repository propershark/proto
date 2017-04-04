require_relative '../helpers/fa_helper.rb'
require_relative '../helpers/rpc_helper.rb'

get '/' do
  haml :index
end
