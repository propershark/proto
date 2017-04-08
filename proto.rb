require 'sinatra'
require 'yaml'

# Core extensions
Dir['./ext/**/*.rb'].each{ |f| require f }

# Controllers
Dir['./controllers/**/*.rb'].each{ |f| require f }
