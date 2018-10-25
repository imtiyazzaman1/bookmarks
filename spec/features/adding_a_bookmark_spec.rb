require 'spec_helper'

feature "Adding a bookmark" do
  scenario "adding a bookmark through a form" do
    visit '/'
    click_link 'Add Bookmark'
    fill_in 'url', with: "http://www.makersacademy.com"
    fill_in 'title', with: "Makers Academy"
    click_button 'Add'
    expect(page).to have_content "Makers Academy"

  end
end
