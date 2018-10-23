require 'bookmark'

describe Bookmark do
  it 'initializes with a name' do
    bookmark = Bookmark.new("Bookmark 1")
    expect(bookmark.name).to eq "Bookmark 1"
  end

  describe '.all' do
    it 'returns a list of bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.google.com"
    end
  end

end
