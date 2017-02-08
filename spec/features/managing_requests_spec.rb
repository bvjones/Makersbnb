# As a user,
# I want to be able to see my received and made hire requests,
# so that I can take relevant actions.

describe 'FEATURE: Requests view' do

    let(:name) { "Fred's House" }
    let(:description) { "Very nice" }
    let(:price) { 200 }
    let(:from) { "20/01/2017" }
    let(:to) { "20/02/2017" }

  scenario 'when logged in, a user is able to see received requests' do
    sign_up
    create_new_space(name: name, description: description, price: price, from: from, to: to)
    click_button('Sign Out')
    sign_up_user_two
    make_book(Space.first.id)
    click_button('Sign Out')
    sign_in
    click_link("Requests")
    expect(page).to have_content("Fred's House")
  end

  scenario 'when logged in, a user is able to see sent requests' do
    sign_up
    create_new_space(name: name, description: description, price: price, from: from, to: to)
    click_button('Sign Out')
    sign_up_user_two
    make_book(Space.first.id)
    click_link("Requests")
    expect(page).to have_content("Fred's House")
  end

  xscenario 'when not logged in, a user is not able to see requests' do
    visit '/'
    expect(page).not_to have_link("Requests")
  end

end
