feature "signing in" do
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
