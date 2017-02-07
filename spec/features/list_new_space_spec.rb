# As a user,
# I want to be able to list a new space,
# so that I can rent it to others.

feature 'FEATURE: Creating spaces' do

  let(:name) { "Pedro's House" }
  let(:description) { "Very nice" }
  let(:price) { 200 }
  let(:from) { "20/03/2017" }
  let(:to) { "20/02/2017" }

  scenario'user is able to add a new space' do
    visit '/'
    expect(page).to have_link("List New Space")
  end

  scenario 'user is able to list a space' do
    create_new_space(name: name, description: description, price: price, from: from, to: to)
    expect(page).to have_current_path('/')
    expect(Space.count).to eq 1
  end

end
