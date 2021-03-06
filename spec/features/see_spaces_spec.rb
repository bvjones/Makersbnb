feature "FEATURE: See Spaces" do
  let(:name) { "Pedro's House" }
  let(:description) { "Very nice" }
  let(:price) { 200 }
  let(:from) { "20/03/2017" }
  let(:to) { "20/02/2017" }
  let(:image_url) { "http://cdn.freshome.com/wp-content/uploads/2012/10/bes-small-apartments-designs-ideas-image-17.jpg" }
  let(:test_user) { "Rick" }
  let(:username) { "RICK" }
  let(:email) { "rick@rick.com" }
  let(:password_digest) { "rick" }
  let(:password_confirmation) { "rick" }

  before(:each) do
    allow(Messenger).to receive(:call)
  end

  scenario "Home page redirects to /spaces" do
    visit('/')
    expect(page).to have_current_path('/spaces')
  end

  scenario "on the spaces page" do
    visit('/')
    sign_up
    create_new_space(name: name, description: description, price: price, from: from, to: to, image_url: image_url)
    expect(page).to have_content("Pedro's House")
    expect(page).to have_content("Very nice")
    expect(page).to have_content(200)
    expect(page).to have_content(20/03/2017)
    expect(page).to have_content(20/02/2017)
  end

  scenario "able to display multiple spaces" do
    current_user = User.create(name: test_user,
                        username: username,
                        email: email,
                        password_digest: password_digest,
                        password_confirmation: password_confirmation)
    10.times do
      space = current_user.spaces.create(name: name,
                                         description: description,
                                         price: price,
                                         from: from,
                                         to:  to,
                                         image_url: image_url
                                        )
    end
    visit('/')
    expect(page).to have_content("Pedro's House", count: 10 )
  end
end
