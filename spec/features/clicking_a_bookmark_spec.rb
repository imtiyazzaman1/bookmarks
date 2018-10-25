feature "Clicking a bookmark" do
  scenario "clicking on a link" do
    add_a_bookmark
    expect(page).to have_link 'Makers Academy'
  end
end
