require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, BCryptHash

  has n, :spaces
  has n, :requests

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password_digest, :confirm => :password_confirmation

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
