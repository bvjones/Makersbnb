def sign_up
  visit '/users/new'
  fill_in 'name', with: 'Fred Jones'
  fill_in 'username', with: 'fred'
  fill_in 'email',   with: 'fred@example.com'
  fill_in 'password', with: 'fred123'
  fill_in 'password_confirmation', with: 'fred123'
  click_button 'Sign Up'
end

def sign_up_user_two
  visit '/users/new'
  fill_in 'name', with: 'Chris'
  fill_in 'username', with: 'chris'
  fill_in 'email',   with: 'chris@example.com'
  fill_in 'password', with: 'chris123'
  fill_in 'password_confirmation', with: 'chris123'
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

def sign_in
  visit '/sessions/new'
  fill_in :email, with: 'fred@example.com'
  fill_in :password, with: 'fred123'
  click_button 'Sign In'
end

def create_new_space(name:, description:, price:, from:, to:)
  visit '/spaces/new'
  fill_in :name, with: name
  fill_in :description, with: description
  fill_in :price, with: price
  fill_in :from, with: from
  fill_in :to, with: to
  click_button("list_new_space")
end

def make_book(id)
  space_id = id
  visit "/spaces/#{space_id}" #update later
  page.execute_script("$('#hidden_date').val('31/03/2017')")
  click_button('request_to_book')
end
