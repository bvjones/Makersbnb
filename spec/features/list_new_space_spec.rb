# As a user,
# I want to be able to list a new space,
# so that I can rent it to others.

feature 'FEATURE: Creating spaces' do
  scenario'user is able to add a new space' do
    visit '/'
    expect(page).to have_link("List New Space")
  end

  scenario 'user is able to list a space' do
    visit '/spaces/new'
    expect(page.status_code).to eq(200)
  end
end
