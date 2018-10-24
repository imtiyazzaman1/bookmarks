require 'spec_helper'

feature 'Viewing bookmarks' do
  scenario 'diplays a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url)
      VALUES('http://www.makersacademy.com'),
      ('http://www.google.com');"
    )

    visit('/bookmarks')
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.google.com'
  end
end
