feature 'deleting a bookmark' do
  before do
    visit '/'
    click_link 'Add Bookmark'
    fill_in 'url', with: "http://www.makersacademy.com"
    fill_in 'title', with: "Makers Academy"
    click_button 'Add'
  end

  scenario 'user can click delete' do
    click_button "Delete"
    expect(page).not_to have_content "Makers Academy"
  end
end
