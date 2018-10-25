require 'spec_helper'

feature "Adding a bookmark" do
  before do
    visit '/'
    click_link 'Add Bookmark'
  end

  scenario "adding a bookmark through a form" do
    fill_in 'url', with: "http://www.makersacademy.com"
    fill_in 'title', with: "Makers Academy"
    click_button 'Add'
    expect(page).to have_content "Makers Academy"
  end

  scenario "checking the bookmark is a valid URL" do
    fill_in 'url', with: "httpwww.makersacademy.com"
    fill_in 'title', with: "Makers Academy"
    click_button 'Add'
    expect(page).to have_content "URL is invalid, try again."
  end
end
