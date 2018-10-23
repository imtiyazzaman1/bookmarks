feature "index page" do
  scenario "display bookmark manager title" do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end
end
