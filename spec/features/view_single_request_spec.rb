feature "FEATURE: view single request" do

  let(:name) { "Pedro's House" }
  let(:description) { "Very nice" }
  let(:price) { 200 }
  let(:from) { "20/03/2017" }
  let(:to) { "20/02/2017" }

  before(:each) do
    allow(SignupMessenger).to receive(:call)
  end

  # before(:each, js: true) do
  #   sign_up
  #   create_new_space(name: name, description: description, price: price, from: from, to: to)
  #   click_button('Sign Out')
  #   sign_up_user_two
  #   make_book(Space.first.id)
  #   click_button('Sign Out')
  #   sign_in
  #   click_link("Requests")
  #   click_link("Pedro's House")
  # end

  scenario "create a request and review its request page", js: true do
    sign_up
    create_new_space(name: name, description: description, price: price, from: from, to: to)
    click_button('Sign Out')
    sign_up_user_two
    make_book(Space.first.id)
    click_button('Sign Out')
    sign_in
    click_link("Requests")
    click_link("Pedro's House")
    expect(page).to have_content("Review your request")
  end

  feature 'approving a request' do
    scenario 'it changes the request status', js: true do
      sign_up
      create_new_space(name: name, description: description, price: price, from: from, to: to)
      click_button('Sign Out')
      sign_up_user_two
      make_book(Space.first.id)
      click_button('Sign Out')
      sign_in
      click_link("Requests")
      click_link("Pedro's House")
      find('#confirm_book').click
      expect(Request.first.status).to eq("confirmed")
    end
    scenario 'it tells us the Request has been approved', js: true do
      sign_up
      create_new_space(name: name, description: description, price: price, from: from, to: to)
      click_button('Sign Out')
      sign_up_user_two
      make_book(Space.first.id)
      click_button('Sign Out')
      sign_in
      click_link("Requests")
      click_link("Pedro's House")
      find('#confirm_book').click
      expect(page).to have_content('Request has been confirmed')
    end
  end

  scenario 'denying a request', js: true do
    sign_up
    create_new_space(name: name, description: description, price: price, from: from, to: to)
    click_button('Sign Out')
    sign_up_user_two
    make_book(Space.first.id)
    click_button('Sign Out')
    sign_in
    click_link("Requests")
    click_link("Pedro's House")
    find('#deny_book').click
    expect(Request.first.status).to eq("denied")
  end
  scenario 'it tells us the Request has been denied', js: true do
    sign_up
    create_new_space(name: name, description: description, price: price, from: from, to: to)
    click_button('Sign Out')
    sign_up_user_two
    make_book(Space.first.id)
    click_button('Sign Out')
    sign_in
    click_link("Requests")
    click_link("Pedro's House")
    find('#deny_book').click
    expect(page).to have_content('Request has been denied')
  end

end
