describe 'UNIT: User' do
  scenario 'signing up a user' do
    visit '/users/new'
    fill_in 'name', with: 'Fred Jones'
    fill_in 'username', with: 'fred'
    fill_in 'email',   with: 'fred@example.com'
    fill_in 'password', with: 'fred123'
    click_button('Submit')

    expect(User.count).to eq 1
  end
end
