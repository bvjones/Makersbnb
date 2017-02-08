require 'dm-validations'

class Request
  include DataMapper::Resource

  property :id, Serial
  property :date, Date, required: true
  property :status, String, required: true

  belongs_to :user
  belongs_to :space
end
