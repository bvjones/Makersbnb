require 'mailgun'
require 'dotenv/load'

class Messenger
  def initialize(mailer: nil)
   @mailer = mailer || Mailgun::Client.new(ENV["your_api_key"])
  end

  def self.call(user, type, mailer = nil)
   new(mailer: mailer).call(user,type)
  end

  def call(user, type)
    if type == "sign_up"
      message_params = sign_up(user)
    elsif type == "create_new_space"
      message_params = create_new_space(user)
    end
    mailer.send_message(ENV["mailgun_domain_name"], message_params)
  end

  def sign_up(user)
    {from: "makerbnb@mail.com",
      to: user.email,
      subject: "Welcome email",
      text: "Welcome #{user.name}! Your are now part of MakersBnB! Visit us at: https://makersbnb-mrbp.herokuapp.com"}
  end


  def create_new_space(user)
    {from: "makerbnb@mail.com",
      to: user.email,
      subject: "New Space",
      text: "Hi #{user.name}! You just added a new space to MakersBnB! Visit us at: https://makersbnb-mrbp.herokuapp.com"}
  end

  private
  attr_reader :mailer
end
