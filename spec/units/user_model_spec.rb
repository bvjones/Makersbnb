describe 'UNIT: User' do
  scenario 'signing up a user' do
    visit '/users/new'
    fill_in 'name', with: 'Fred Jones'
    fill_in 'username', with: 'fred'
    fill_in 'email',   with: 'fred@example.com'
    fill_in 'password', with: 'fred123'

    expect {click_button('Submit') }.to change{User.count}.by(1)
  end
end
