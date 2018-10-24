require 'spec_helper'

feature 'Viewing bookmarks' do
  scenario 'diplays a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url, title)
      VALUES('http://www.makersacademy.com', 'Makers Academy'),
      ('http://www.google.com', 'Google');"
    )

    visit('/bookmarks')
    expect(page).to have_content 'Makers Academy'
    expect(page).to have_content 'Google'
  end
end
