feature 'FEATURE: Creating a request' do
  xscenario 'logged in user is able to create a request' do
    sign_up
    visit '/' #update later
    expect(page).to have_button("Request to Book")
  end

  xscenario 'when not logged in' do
    visit '/' #update later
    expect(page).not_to have_button("Request to Book")
  end

end
