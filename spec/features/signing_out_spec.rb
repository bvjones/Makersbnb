feature 'Signing out' do
  describe 'when signed in' do
    scenario 'signing out as a user' do
      sign_up
      click_button 'Sign Out'

      expect(page).to have_content('goodbye!')
      expect(page).not_to have_content('Welcome fred')
    end
  end

  xdescribe 'when not signed in' do
    scenario 'cant see the sign out button' do
    expect(page).not_to have_content('Sign Out')
    end
  end
end
