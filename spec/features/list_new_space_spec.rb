# As a user,
# I want to be able to list a new space,
# so that I can rent it to others.

feature 'FEATURE: Creating spaces' do

  let(:name) { "Pedro's House" }
  let(:description) { "Very nice" }
  let(:price) { 200 }
  let(:from) { "20/01/2017" }
  let(:to) { "20/02/2017" }
  let(:image_url) { "http://cdn.freshome.com/wp-content/uploads/2012/10/bes-small-apartments-designs-ideas-image-17.jpg" }

  scenario'user is able to add a new space' do
    sign_up
    visit '/'
    expect(page).to have_link("List New Space")
  end

  scenario 'when user is not signed in List New Space button should not be available' do
    visit '/'
    expect(page).not_to have_link("List New Space")
  end

  scenario 'user is able to list a space' do
    sign_up
    create_new_space(name: name, description: description, price: price, from: from, to: to, image_url: image_url)
    expect(page).to have_current_path('/spaces')
    expect(Space.count).to eq 1
  end

  describe 'Following fields must be provided:' do
    scenario 'name' do
      sign_up
      create_new_space(name: "", description: description, price: price, from: from, to: to, image_url: image_url)
      expect(page).to have_content('Name must not be blank')
    end
    scenario 'description' do
      sign_up
      create_new_space(name: name, description: "", price: price, from: from, to: to, image_url: image_url)
      expect(page).to have_content('Description must not be blank')
    end
    scenario 'price' do
      sign_up
      create_new_space(name: name, description: description, price: "", from: from, to: to, image_url: image_url)
      expect(page).to have_content('Price must not be blank')
    end
    scenario 'From' do
      sign_up
      create_new_space(name: name, description: description, price: price, from: "", to: to, image_url: image_url)
      expect(page).to have_content('From must not be blank')
    end
    scenario 'to' do
      sign_up
      create_new_space(name: name, description: description, price: price, from: from, to: "", image_url: image_url)
      expect(page).to have_content('To must not be blank')
    end
    scenario 'image url' do
      sign_up
      create_new_space(name: name, description: description, price: price, from: from, to: to, image_url: "")
      expect(page).to have_content('Image url must not be blank')
    end
  end
end
