require 'messenger'

describe Messenger do
  let(:user){double :user, name: "user", email: "test@test.com"}
  let(:mail_gun_client){double :mail_gun_client}
  let(:type1){"sign_up"}
  let(:type2){"create_new_space"}
  let(:mailgun_domain_name) { ENV["mailgun_domain_name"] }

  it "sends a message when a user signs up" do
    message_params = {from: "makerbnb@mail.com",
                      to: user.email,
                      subject: "Welcome email",
                      text: "Welcome #{user.name}! Your are now part of MakersBnB! Visit us at: https://makersbnb-mrbp.herokuapp.com"}
    expect(mail_gun_client).to receive(:send_message).with(mailgun_domain_name, message_params)
    described_class.call(user, type1, mail_gun_client)
  end

  it "sends a message when a user lists new space" do
    message_params = {from: "makerbnb@mail.com",
                      to: user.email,
                      subject: "New Space",
                      text: "Hi #{user.name}! You just added a new space to MakersBnB! Visit us at: https://makersbnb-mrbp.herokuapp.com"}
    expect(mail_gun_client).to receive(:send_message).with(mailgun_domain_name, message_params)
    described_class.call(user, type2, mail_gun_client)
  end
end
