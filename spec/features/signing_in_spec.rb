feature "FEATURE: signing in" do

  before(:each) do
    allow(Messenger).to receive(:call)
  end

  describe 'when not signed in' do
    scenario "signing in as an existing user" do
      sign_up
      visit '/sessions/new'
      fill_in :email, with: 'fred@example.com'
      fill_in :password, with: 'fred123'
      click_button 'Sign In'
      expect(page).to have_content('fred')
    end

    scenario "signing in with an incorrect password" do
      sign_up
      visit '/sessions/new'
      fill_in :email, with: 'fred@example.com'
      fill_in :password, with: 'fred'
      click_button 'Sign In'
      expect(page).to have_content('The email or password is incorrect')
    end
  end

  describe 'when signed in' do
    scenario 'cant see the sign in button' do
      sign_up
      expect(page).not_to have_content('Sign In')
    end
  end
end
