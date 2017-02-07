# require 'sinatra/base'

# class MakersBnB < Sinatra::Base
#   get '/' do
#     'Hello MakersBnB!'
#   end
#
#   # start the server if ruby file executed directly
#   run! if app_file == $0
# end


ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'dmconfig'
require_relative 'server'
#ADD CONTROLLER REQUIRES HERE!!!!
require_relative 'controllers/users'
# require_relative 'controllers/user.rb'

MakersBnB.run! if $0 == 'app/app.rb'
