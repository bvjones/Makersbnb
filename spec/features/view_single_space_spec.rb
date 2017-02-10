feature "FEATURE: view single space" do

  let(:name) { "Pedro's House" }
  let(:description) { "Very nice" }
  let(:price) { 200 }
  let(:from) { "20/03/2017" }
  let(:to) { "20/02/2017" }
  let(:image_url) { "http://cdn.freshome.com/wp-content/uploads/2012/10/bes-small-apartments-designs-ideas-image-17.jpg" }


  before(:each) do
    allow(Messenger).to receive(:call)
  end

  scenario "Create space then view its spaces page" do
    visit('/')
    sign_up
    create_new_space(name: name, description: description, price: price, from: from, to: to, image_url: image_url)
    click_link("Pedro's House")
    expect(page).to have_content(name)
  end

end
