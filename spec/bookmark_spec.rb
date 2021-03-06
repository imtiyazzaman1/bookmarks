require 'bookmark'

describe Bookmark do
  it 'initializes with url and title' do
    bookmark = Bookmark.new(1, 'bookmark.com', 'Bookmark 1')
    expect(bookmark.title).to eq 'Bookmark 1'
    expect(bookmark.url).to eq 'bookmark.com'
  end

  describe '::all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url)
        VALUES('http://www.makersacademy.com'),
        ('http://www.google.com');"
      )
      bookmarks = Bookmark.all
      expect(bookmarks[0].url).to eq('http://www.makersacademy.com')
      expect(bookmarks[1].url).to eq('http://www.google.com')
    end
  end

  describe '::create' do
    it 'should add a new bookmark to database' do
      Bookmark.create("http://www.makersacademy.com", 'Makers Academy')
      bookmarks = Bookmark.all
      expect(bookmarks[0].url).to eq('http://www.makersacademy.com')
    end
  end

  describe '::delete' do
    it 'should delete a bookmark from the database' do
      Bookmark.create("http://www.makersacademy.com", 'Makers Academy')
      Bookmark.delete("1")
      bookmarks = Bookmark.all
      expect(bookmarks).to be_empty
    end
  end

  describe '::update' do
    it "should update an existing bookmark in the database" do
      Bookmark.create("http://www.makersacademy.com", 'Makers Academy')
      Bookmark.update('1', 'https://makers.tech', 'Makers')

      expect(Bookmark.all.first.title).to eq 'Makers'
      expect(Bookmark.all.first.url).to eq 'https://makers.tech'
    end
  end

  describe '::find' do
    it "should return a bookmark with the matching id" do
      Bookmark.create("http://www.makersacademy.com", 'Makers Academy')

      bookmark = Bookmark.find('1')
      expect(bookmark.title).to eq 'Makers Academy'
    end
  end

  describe '::is_valid?' do

    it 'Should return false with a invalid url' do
          url = 'www.makersacademy.com'
          expect(Bookmark.create(url, 'Makers Academy')).to eq false
        end
  end
end
