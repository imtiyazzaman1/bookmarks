require 'bookmark'

describe Bookmark do
  it 'initializes with a name' do
    bookmark = Bookmark.new('Bookmark 1')
    expect(bookmark.name).to eq 'Bookmark 1'
  end

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url)
        VALUES('http://www.makersacademy.com'),
        ('http://www.google.com');"
      )
      bookmarks = Bookmark.all
      expect(bookmarks).to include 'http://www.makersacademy.com'
      expect(bookmarks).to include 'http://www.google.com'
    end
  end

  describe '.create' do
    it 'should add a new bookmark to database' do
      Bookmark.create("http://www.makersacademy.com")
      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.makersacademy.com')
    end
  end
end
