ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'dmconfig'
require_relative 'server'
#ADD CONTROLLER REQUIRES HERE!!!!
require_relative 'controllers/users.rb'
require_relative 'controllers/spaces.rb'
require_relative 'controllers/sessions.rb'
require_relative 'controllers/requests.rb'

MakersBnB.run! if $0 == 'app/app.rb'
