class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String, format: :email_address, required: true
  property :email, String, required: true
  property :password, String, required: true

end
