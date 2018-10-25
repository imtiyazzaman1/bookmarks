def add_a_bookmark
  visit '/add_bookmark'
  fill_in 'url', with: "http://www.makersacademy.com"
  fill_in 'title', with: "Makers Academy"
  click_button 'Add'
end
