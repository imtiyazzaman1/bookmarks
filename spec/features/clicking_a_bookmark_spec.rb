feature "Clicking a bookmark" do
  scenario "clicking on a link" do
    visit '/add_bookmark'
    fill_in 'url', with: "http://www.makersacademy.com"
    fill_in 'title', with: "Makers Academy"
    click_button 'Add'
    expect(page).to have_link 'Makers Academy'
  end
end
