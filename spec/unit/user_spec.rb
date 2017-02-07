describe User do

  let(:name) { 'J T Kirk' }
  let(:email) { 'JTK@test.com' }
  let(:username) { 'TheShat' }
  let(:password) { 'password' }
  let(:password_confirmation) { 'password' }

  let(:user) { described_class.create(name: name, email: email, username: username, password_digest: password, password_confirmation: password_confirmation) }

  describe "#self.authenticate" do
    before(:each) do
      User.create(name: name, email: email, username: username, password_digest: password, password_confirmation: password_confirmation)
    end

    it 'authenticates when gives a valid email and password' do
      user = User.first(email: email)
      authenticated_user = described_class.authenticate(email, password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticate when gives a wrong password' do
      authenticated_user = described_class.authenticate(email, "wrongpassword")
      expect(authenticated_user).to be nil
    end
  end

end
