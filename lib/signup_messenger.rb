require 'mailgun'
require 'dotenv/load'

class SignupMessenger
 def initialize(mailer: nil)
   @mailer = mailer || Mailgun::Client.new(ENV["your_api_key"])
 end

 def self.call(user, mailer = nil)
   new(mailer: mailer).call(user)
 end

 def call(user)
   message_params = {from: "makerbnb@mail.com",
                     to: user.email,
                     subject: "Welcome email",
                     text: "Welcome to MakersBnB!\n
                            Visit us at:\n
                            https://makersbnb-mrbp.herokuapp.com"}

    mailer.send_message(ENV["mailgun_domain_name"], message_params)
 end

 private
 attr_reader :mailer
end
