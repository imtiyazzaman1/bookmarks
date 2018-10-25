require 'pg'

class Bookmark
  attr_reader :url, :title, :id
  @connection = nil

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    connect_to_db
    result = @connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.create(url, title)
    return false unless is_valid?(url)
    connect_to_db
    @connection.exec("INSERT INTO bookmarks (url, title)
      VALUES('#{url}', '#{title}');"
    )
  end

  def self.delete(id)
    connect_to_db
    @connection.exec("DELETE FROM bookmarks WHERE id = '#{id}';")
  end

  def self.update(id, new_url, new_title)
    connect_to_db
    @connection.exec("UPDATE bookmarks
      SET url = '#{new_url}',
      title = '#{new_title}'
      WHERE id = '#{id}';"
    )
  end

  def self.find(id)
    connect_to_db
    result = @connection.exec("SELECT * FROM Bookmarks
      WHERE id = '#{id}'"
    )
    Bookmark.new(result[0]['id'], result[0]['url'], result[0]['title'])
  end


  private
  def self.connect_to_db
    if ENV['ENV'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.is_valid?(url)
    url =~ URI::regexp
  end
end
