describe 'FEATURE: Signing up' do
  scenario 'user can sign up' do
    expect{sign_in}.to change{User.count}.by(1)
  end
  scenario 'user cant sign up with existing email or username' do
    sign_in
    sign_in
    expect(page).to have_content('Username is already taken. Email is already taken.')
  end

end
