require 'dm-validations'

class Space

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :description, Text, required: true
  property :price, Integer, required: true
  property :from, Date, required: true
  property :to, Date, required: true

  belongs_to :user
  has n, :requests

end
