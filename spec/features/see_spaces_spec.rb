feature "FEATURE: See Spaces" do

  scenario "Home page redirects to /spaces" do
    visit('/')
    expect(page).to have_current_path('/spaces')
  end

end
