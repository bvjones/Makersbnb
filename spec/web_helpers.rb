def sign_in
  visit '/users/new'
  fill_in 'name', with: 'Fred Jones'
  fill_in 'username', with: 'fred'
  fill_in 'email',   with: 'fred@example.com'
  fill_in 'password', with: 'fred123'
  click_button 'Sign Up'
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
