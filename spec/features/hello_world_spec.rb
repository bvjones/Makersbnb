feature "FEATURE: Hello world" do
  scenario "Can see hello world" do
    visit('/')
    expect(page).to have_content("Hello World")
  end
end
