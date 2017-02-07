require 'data_mapper'
require 'dm-postgres-adapter'
#REQUIRE MODELS HERE
require_relative 'models/space.rb'
require_relative 'models/user.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
