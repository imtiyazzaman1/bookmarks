require 'pg'

class Bookmark
  attr_reader :url, :title, :id
  @connection = nil

  def self.all
    connect_to_db
    result = @connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.create(url, title)
    connect_to_db
    @connection.exec("INSERT INTO bookmarks (url, title)
      VALUES('#{url}', '#{title}');"
    )
  end

  def self.delete(id)
    connect_to_db
    @connection.exec("DELETE FROM bookmarks WHERE id = '#{id}';")
  end

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  private
  def self.connect_to_db
    if ENV['ENV'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end
end
