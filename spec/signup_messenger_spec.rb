require 'signup_messenger'

describe SignupMessenger do
  let(:user){double :user, email: "test@test.com"}
  let(:mail_gun_client){double :mail_gun_client}
  let(:mailgun_domain_name) { ENV["mailgun_domain_name"] }

  it "sends a message to mailgun when it is called" do
    message_params = {from: "makerbnb@mail.com",
                      to: user.email,
                      subject: "Welcome email",
                      text: "Welcome to MakersBnB!\n
                            Visit us at:\n
                            https://makersbnb-mrbp.herokuapp.com"}
    expect(mail_gun_client).to receive(:send_message).with(mailgun_domain_name, message_params)
    described_class.call(user, mail_gun_client)
  end
end
