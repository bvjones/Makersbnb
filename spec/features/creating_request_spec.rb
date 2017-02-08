feature 'FEATURE: Creating a request' do

  let(:name) { "Pedro's House" }
  let(:description) { "Very nice" }
  let(:price) { 200 }
  let(:from) { "20/01/2017" }
  let(:to) { "20/02/2017" }

  xscenario 'logged in user is able to create a request' do
    sign_up
    create_new_space(name: name, description: description, price: price, from: from, to: to)
    visit '/' #update later
    expect(page).to have_button("Request to Book")
  end

  xscenario 'when not logged in' do
    visit '/' #update later
    expect(page).not_to have_button("request_to_book")
  end

  scenario 'logged in user is able to book' do
    sign_up
    create_new_space(name: name, description: description, price: price, from: from, to: to)
    space_id = Space.first.id
    visit "/spaces/#{space_id}" #update later
    fill_in(:date, with: "31/01/2017")
    expect{click_button('request_to_book')}.to change{Request.count}.by(1)
  end

end
