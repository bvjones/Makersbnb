describe 'UNIT: User' do
  scenario 'signing up a user' do
    visit '/users/new'
    fill_in 'name', with: 'Fred Jones'
    fill_in 'username', with: 'fred'
    fill_in 'email',   with: 'fred@example.com'
    fill_in 'password', with: 'fred123'
    click_button('Submit')
    p "All users", User.all

    # expect { }.to change{User.count}.by(1)

  end
end
