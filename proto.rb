require 'sinatra'
require 'yaml'

Dir['./controllers/**/*.rb'].each{ |f| require f }
