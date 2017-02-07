def sign_in
  visit '/users/new'
  fill_in 'name', with: 'Fred Jones'
  fill_in 'username', with: 'fred'
  fill_in 'email',   with: 'fred@example.com'
  fill_in 'password', with: 'fred123'
  click_button 'Submit'
end
