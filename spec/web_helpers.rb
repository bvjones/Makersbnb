def sign_up
  visit '/users/new'
  fill_in 'name', with: 'Fred Jones'
  fill_in 'username', with: 'fred'
  fill_in 'email',   with: 'fred@example.com'
  fill_in 'password', with: 'fred123'
  fill_in 'password_confirmation', with: 'fred123'
  click_button 'Sign Up'
end

def incorrect_sign_up
  visit '/users/new'
  fill_in 'name', with: 'Fred Jones'
  fill_in 'username', with: 'fred'
  fill_in 'email',   with: 'fred@example.com'
  fill_in 'password', with: 'fred123'
  fill_in 'password_confirmation', with: 'fred'
  click_button 'Sign Up'
end
