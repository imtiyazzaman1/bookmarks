feature "Updating bookmarks" do
  scenario "by clicking update" do
    add_a_bookmark
    click_button 'Update'

    fill_in 'title', with: 'Makers'
    fill_in 'url', with: 'https://makers.tech'
    click_button 'Add'

    expect(page).not_to have_content 'Makers Academy'
    expect(page).to have_content 'Makers'

  end
end
