feature "FEATURE: view single request" do

  let(:name) { "Pedro's House" }
  let(:description) { "Very nice" }
  let(:price) { 200 }
  let(:from) { "20/03/2017" }
  let(:to) { "20/02/2017" }

  scenario "create a request and review its request page" do
    sign_up
    create_new_space(name: name, description: description, price: price, from: from, to: to)
    click_button('Sign Out')
    sign_up_user_two
    make_book(Space.first.id)
    click_button('Sign Out')
    sign_in
    click_link("Requests")
    click_link("Pedro's House")
    expect(page).to have_button("Confirm request from chris@example.com")
    expect(page).to have_button("Deny request from chris@example.com")
  end

end
